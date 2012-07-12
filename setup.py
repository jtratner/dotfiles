#!/usr/bin/env python
import os
import re
import shutil
import argparse
from subprocess import Popen, PIPE
import sys
DEBUG = True
PREFIX = "."
BACKUP_PREFIX = ""
SYMLINK_SUB = re.compile("\.symlink")
SYMLINK_RE = re.compile(".*\.symlink")
# setup script for windows, based on a combo of sontek and holman's models
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
def backup_rename(source, counter = None, symlinks=None, prefix=None, suffix=None, do_backup=True):
    counter = counter or 0
    symlinks = symlinks if symlinks is not None else True
    prefix = prefix or ""
    suffix = suffix if suffix is not None else ".bak"
    do_backup = do_backup if do_backup is not None else True
    if not do_backup:
        print "Not backing up"
        return True
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

def link_file(source, home, symlinks=False, prefix=None, backup_prefix=None, backup_suffix=None, **kwargs):
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
        exists = not backup_rename(target, backup_prefix, backup_suffix, symlinks=symlinks, **kwargs)
    # if removed or didn't exist initially
    if not exists:
        return make_link(source, target, symlinks, **kwargs)
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
        had_result = had_result or run_command(command)
    if not had_result:
        print "Nothing to update."
    else:
        print "Finished updating subs."
    return


def do_nothing(*args, **kwargs):
    print "Args: ", args
    print "Kwargs: ", kwargs
update_files = subs = merge_upstream = vim = dots = install = uninstall = do_nothing
def update_files(update="all", repo="origin", debug=None, **kwargs):
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
    if kwargs.get("has_windows"):
        print "Detected Windows, only installing vimfiles"
        kwargs["update"] = "subs"
        update_files(*args, **kwargs)
        make_symlinks(*args, **kwargs)
        vim(*args, **kwargs)
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

def add_directory_group(parser, dir_description=None):
    dir_description = dir_description or """(optional) set default directories for source, target, vim, etc"""
    set_directories = parser.add_argument_group(title="Choose default directories", description=dir_description)
    set_directories.add_argument("--dotfiles", metavar="SRC", dest="directory", nargs=1, 
            help="explicitly set location of dotfiles/source files for copying") 
    set_directories.add_argument("--vim-directory", metavar="DIR", dest="vim_directory", nargs=1, 
            help="directory to install vim.symlink (default: ~/.vim - posix/osx, $HOME/vimfiles - windows)")
    set_directories.add_argument("--target", default=None, dest="home",help="""target directory for copying,
        default is home directory""")

def add_filename_group(parser):
    parser.add_argument("--no-backups", dest="no_backups", action="store_true", default=False, help="don't make backups, just overwrite")
    parser.add_argument("--prefix", dest="prefix", nargs=1, help="set prefix for *.symlink files")

ARGS_SET = set(["no_backups", "backup_prefix", "backup_suffix", "dotfiles", "vim_directory", "home", "symlink"])
def add_windows(parser, windows_help=None):
    windows_help = windows_help or """
use if the system isn't detecting that your os is windows. Creates the following defaults:
1. _ as file prefix
2. $HOME/vimfiles as vim directory
3. only installs vimfiles"""

    parser.add_argument("--windows", action="store_true", help=windows_help, default=None)
def add_debug(parser):
    parser.add_argument("-d", "--debug", help="Just print actions to std out, don't do anything.", default=None, action="store_true")
def add_copy_type(parser):
    group = parser.add_mutually_exclusive_group(required=False)
    group.add_argument("--copy", action="store_false", help="force installer to copy *.symlink files instead of symlinking (windows default)", dest="symlink", default=None) 
    group.add_argument("--symlink", action="store_true", help="force installer to symlink *.symlink files (default for non-windows)", dest="symlink")
def add_all(parser, exclude=None):
    """ exclude should be a list of functions"""
    exclude = exclude or set()
    for func in (add_copy_type, add_windows, add_filename_group, add_directory_group, add_debug):
        if func not in exclude:
            func(parser)
parser = argparse.ArgumentParser(description="uninstall, install dotfiles/vimfiles")
subparser = parser.add_subparsers()
installer = subparser.add_parser("install", help="symlink/copy dotfiles on to your system (don't worry, it's all backed up first!", description="Install vim, dotfiles, or both (on Windows all defaults to not installing dotfiles)")
installer.set_defaults(func=install)
installer.add_argument("install_only", nargs="?", help="(optional) 'dotfiles' for only dotfiles or 'vim' for only vimfiles (defaults: posix: allfiles, windows: vimfiles only)", choices=["all, dotfiles, vim"]) 
add_all(installer)


download = subparser.add_parser("download", help="""download the files from github.""", description="""
download dotfiles from github, after download, you can cd into the directory and run the setup.py install script""")
update = subparser.add_parser("update", help="""merge changes (or submodules) from git""",
        description="""
merge changes and/or submodules from git. 
(NOTE: if you installed via copying (e.g. if you are on Windows) you'll have to reinstall via `install all`""")
update.add_argument("update", help="(optional) choose to only update subs or merge changes (from origin)", nargs="?", choices=["subs", "changes", "all"], default="all")
update.set_defaults(func=update_files)
update.add_argument("--repo", help="set which repo to update from (for changes), default is origin", dest="repo", default="origin")
update.add_argument("--dotfiles", help="set dotfiles directory", dest="dotfiles", nargs=1, metavar="DIR")
add_debug(update)
def main():
    args = parser.parse_args()
    args.__dict__["symlinks"] = args.__dict__.get("has_windows", True)
    args.__dict__["directory"] = args.__dict__.get("directory", None) or os.getcwd()
    # global DEBUG
    # DEBUG = "debug" in args.__dict__ and args.debug or DEBUG
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
