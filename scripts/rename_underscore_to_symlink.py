#!/usr/bin/python
# IPython log file
import os
import sys

def rename_files(dirlist, verbose=True):
    print dirlist
    dirlist = map(os.path.abspath, dirlist)
    print dirlist
#(later will update rest to reflect option to do different things and different targets, e.g. renaming dotfiles, etc)
    underscorefiles=[map(lambda x: os.path.join(directory, x), filter(lambda x: x[0] == '_', os.listdir(directory))) for directory in dirlist]
    
    if verbose:
        print underscorefiles

    if len(underscorefiles) == 0:
        print "No '_' files found. Exiting"
        sys.exit(0)

    newsymlinkrenames = []
    backuprenames = []

    for filelist, currdir in zip(underscorefiles, dirlist):

        # get current directory from paths we will be renaming
        backupdir = os.path.join(currdir, "overwritten-files")
        relpathnames = map(os.path.basename, filelist)
        newpathnames = map(lambda x: x[1:] + '.symlink', relpathnames)
        # make a list of new names
        renamed =  map(lambda x: os.path.join(currdir,x), newpathnames)

        # check whether we will overwrite files, so we can back them up
        tb_overwritten = filter(os.path.exists, renamed)

        # rename into backup dir with a '.bak' appended for clarity (and to obfuscate from holman's rakefile)
        backupnames = map(lambda x: os.path.join(backupdir, x+'.bak'),
                          map(os.path.basename, tb_overwritten))
        # store as source,target tuples
        newsymlinkrenames.extend(zip(filelist,renamed))
        backuprenames.extend(zip(tb_overwritten,backupnames))
        print newsymlinkrenames
        print "..."
        print backuprenames


    # prompt user to backup and store as bool
    if backuprenames == []:
        print "Won't overwrite anything. Good"
        do_backup = False
    else:
        print "The following files would be overwritten by this change:"
        for src in backuprenames:
            print repr(src)
        do_backup = raw_input("(No changes will be made until after all operations have been confirmed)\nBack these files up first? [Y/n]") != "n"
        if do_backup: print "Okay, you will find them in the folder 'overwritten-files' in each directory"
    print "The following files will be renamed to '.symlink'"
    for src, target in newsymlinkrenames:
        print "%r -> %r" % (src, target)

    # confirm change
    if raw_input("Rename all files? [Y/n]") in ["n","no","q:","quit"]:
        print "Okay, no changes made, quitting"
        sys.exit(1)

    # order matters, so first do existing if desired.
    if do_backup:
        for src, target in backuprenames:
            os.renames(src,target)
            print "Backup: moved %r -> %r" % (src, target)

    # rename files
    for src, target in newsymlinkrenames:
        print src, target
        os.rename(src,target)
        print "Renamed %r -> %r" % (src, target)

    print "completed renaming!"
    sys.exit(0)

def main():
    import sys
    rename_files(map(os.path.abspath, sys.argv[1:]))

if __name__ == '__main__':
    main()
