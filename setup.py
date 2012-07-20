#!/usr/bin/env python
import os
import sys
import re
import shutil
from subprocess import Popen, PIPE
DEBUG = True
PREFIX = "."
BACKUP_PREFIX = ""
SYMLINK_SUB = re.compile("\.symlink")
SYMLINK_RE = re.compile(".*\.symlink")
def remove(path):
    """ tries to remove path or directory. returns True if successful, False otherwise.
    (silences OSErrors and shutil.Error messages)."""
    try:
        if os.path.isdir(path):
            if DEBUG: print "removing directory {path}".format(path=path); return True
            shutil.rmtree(path)
        else:
            if DEBUG: print "removing path {path!r}".format(path=path); return True
            os.remove(path)
        return True
    except OSError as e:
        print "Couldn't remove file -- {message}".format(message=e.strerror)
        return False
    except shutil.Error as e:
        print "Couldn't remove director -- {message}".format(message=e[2])

def make_link(source, target, symlinks=True):
    """ tries to copy or symlink given source path or directory. Uses shutil.copytree or shutil.copy2 to do so.
    returns True if successful, False otherwise (silences shutil.Error messages).

    :params:
        :param source: absolute path to source file
        :param target: absolute path where source file will be copied
        :param symlinks: whether to make a symlink or copy (default: True)
        :type symlinks: bool
        """

    try:
        if not symlinks:
            if os.path.isdir(source):
                if DEBUG: print "copying from {source} to {target}".format(source=source, target=target); return True
                shutil.copytree(source, target, symlinks=symlinks)
            else:
                if DEBUG: print "copying from {source} to {target}".format(source=source, target=target); return True
                shutil.copy2(source, target)
            return True
        else:
            if DEBUG: print "symlinking from {source} to {target}".format(source=source, target=target); return True
            os.symlink(source, target)
            return True
    except shutil.Error as e:
        print "Couldn't copy {source} to {target}: {message!r}".format(source=source, target=target, messsage=e[2])
        return False
    except OSError as e:
        print "Couldn't make symlink from {source} to {target}: {message!r}".format(source=source, target=target, message=e.strerror)
        return False


# only installs vim-related files (for now), in the future, may try for valgrind, etc
def backup_rename(source, counter = None, symlinks=None, prefix=None, suffix=None):
    counter = counter or 0
    symlinks = symlinks if symlinks is not None else True
    prefix = prefix or ""
    suffix = suffix if suffix is not None else ".bak"
    split = os.path.split(source)
    prefix_str, suffix_str = prefix, suffix
    if counter and prefix:
        prefix_str = prefix + str(counter) if counter else ""
    else:
        suffix_str += str(counter) if counter else ""
    path = os.path.join(split[0], prefix_str + split[1] + suffix_str)
    if os.path.exists(path):
        return backup_rename(source, counter + 1, prefix, suffix, symlinks)
    else:
       print("Backing up {source} to {path}".format(source=source, path=path))
       return make_link(source, path, symlinks) and remove(source)

def link_file(source, home, symlinks=False, prefix=None, backup_prefix=None, backup_suffix=None, do_backups=True):
    """ attempts to link source file to file in homedirectory.
    On Windows, you can't symlink, so it instead makes a copy"""
    assert source is not None, "incorrect data passed to link file"
    prefix = prefix if prefix is not None else PREFIX
    backup_prefix = backup_prefix if backup_prefix is not None else BACKUP_PREFIX,
    backup_suffix = backup_suffix if backup_suffix is not None else ".bak",
    base = prefix + SYMLINK_SUB.sub("", os.path.basename(source))
    target=os.path.join(home, base)
    exists = os.path.exists(target)
    # first try and remove
    if exists:
        exists = not backup_rename(source=target, prefix=backup_prefix, suffix=backup_suffix, symlinks=symlinks, **kwargs)
    # if removed or didn't exist initially
    if not exists:
        return make_link(source, target, symlinks, do_backups=do_backups)
    else:
        return False

def find_files(directory, regex=SYMLINK_RE, depth=0, maxdepth=5):
    """ attempts to find all files/directories in given directory and its subdirectories that 
    match the given regular expression <regex>. Stops at depth of maxdepth if given. (defaults to 5).
    Returns *absolute paths*"""
    regex = re.compile(regex)
    found = list()
    directory = os.path.abspath(directory)
    for filename in os.listdir(directory):
        if regex.match(filename):
            found.append(os.path.join(directory, filename))
        elif os.path.isdir(filename):
            found.extend(find_files(filename, regex, depth + 1, maxdepth))
    # get rid of duplicates
    return list(set(found))

def make_symlinks(directory, home, regex, symlinks=False, maxdepth=5, vim_directory=None, **kwargs):
    print "Making symlinks"
    not_linked = []
    names = find_files(directory, regex, 0, maxdepth) or []
    print "Installing symlinks"
    for filename in names:
        if os.path.basename(filename) == "vim.symlink" and vim_directory:
            link_file(filename, home = vim_directory, symlinks=symlinks, **kwargs)
        if not link_file(filename, home=home, symlinks=symlinks, **kwargs):
            not_linked.append(filename)
    if symlinks:
        pass
    if not_linked:
        print "Couldn't link these files: {files}".format(files=', '.join(not_linked))
    return not not_linked

def run_command(command, shell=False):
    if DEBUG:
        print str(command) + "\n"
        return
    sys.__stdout__.write(str(command) + "\n")
    stdout = Popen(command, stdout=PIPE, shell=True).stdout
    line = stdout.readline()
    count = 1 if line else 0
    while line:
        sys.__stdout__.write(line)
        line = stdout.readline()
        count += 1
    return count
def update_submodules(directory = None):
    directory = directory or os.listdir(os.getcwd())
    error = Popen("git status", stdout=PIPE, stderr=PIPE, shell=True).stderr.read()
    if error:
        print "Not updating, something awry with git/not a git repo."
        return
    print "Updating submodules"
    run_command = lambda command: Popen(command, stdout=None, shell=True)
    had_result = False
    for command in ( "git submodule sync", "git submodule init", 
            "git submodule update", "git submodule foreach git pull origin master", 
            "git submodule foreach git submodule init",
            "git submodule foreach git submodule update"):
        result = run_command(command)
        had_result = had_result or result
    if not had_result:
        print "Nothing to update."
    else:
        print "Finished updating subs."
    return


def do_nothing(*args, **kwargs):
    print "Args: ", args
    print "Kwargs: ", kwargs
update_files = subs = merge_upstream = vim = dots = install = uninstall = do_nothing
def update_files(update="all", repo="origin", debug=None):
    print "Checking if git repo and can run."
    error = Popen("git status",stdout=PIPE, stderr=PIPE, shell=True).stderr.read()
    if error:
        if "Not a git repository" in error:
            print "Can't run unless we're in a git repo! Sorry.\n" + error
        else:
            print "Sorry, there was a git error.\n" + error
        sys.exit("git error")
    if update in ("all", "changes"):
        print "Ok, we're good. Let's go!\n"
        print "Saving your current state"
        run_command("git stash save")
        print "Pulling changes from {repo}".format(repo = repo)
        run_command("git pull {repo} master".format(repo=repo))
        run_command("git merge {repo}/master".format(repo=repo))
        print "Re-applying your changes"
        run_command("git stash apply")
    if update in ("all", "subs"):
        update_submodules()
    print "Finished updates."

def install(*args, **kwargs):
    if kwargs.get("has_windows") or kwargs.get("install_only")=="vim":
        print "Detected Windows, only installing vimfiles"
        kwargs["update"] = "subs"
        update_files(*args, **kwargs)
        make_symlinks(*args, **kwargs)
        vim(*args, **kwargs)
    elif kwargs.get("install_only") == "dotfiles":
        make_symlinks(regex=SYMLINK_RE, **kwargs)
        dots(*args, **kwargs)
    else:
        kwargs["update"] = "all"
        print "installing all dotfiles and getting submodules"
        update_files(*args, **kwargs)
        make_symlinks(regex=SYMLINK_RE, **kwargs)
        vim(*args, **kwargs)
        dots(*args, **kwargs)
    print "finished"
    sys.exit(0)
# def uninstall():
#     pass
def main():
    has_windows = os.name == "windows"
    args = dict( home = os.path.expanduser("~"),
            directory = os.getcwd(),
            debug = DEBUG,
            symlinks = not has_windows)

    if len(sys.argv) == 1:
        install()
    args = {}
    args.__dict__["symlinks"] = args.__dict__.get("has_windows", True)
    args.__dict__["directory"] = os.getcwd()
    global DEBUG
    DEBUG = "debug" in args.__dict__ and args.debug or DEBUG
    if DEBUG:
        print "Running in DEBUG mode, all commands will print to terminal but won't be run."
    if not ("home" in args.__dict__ and args.__dict__["home"] is not None):
        args.__dict__["home"] = os.path.expanduser("~")
    if args.func == update_files:
        print "Updating"
    args.func(**args.__dict__)
    # using_windows = os.name == "windows"
    # regex = SYMLINK_RE
    # home = None
    # dotfiles = None
    # home = None
    # if using_windows:
    #     vim_directory = home + "vimfiles"
    # else:
    #     vim_directory = home + ".vim"
    # make_symlinks(dotfiles, home, symlinks = not using_windows, regex=regex, maxdepth=5, vim_directory=vim_directory)


if __name__ == '__main__':
    main()
