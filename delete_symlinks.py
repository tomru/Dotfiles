#!/usr/bin/env python
import os
import logging


logging.basicConfig(level=logging.WARN)

home = os.path.abspath(os.environ['HOME'])
path = os.path.join(home, '.dotfiles') 
excludes = ['create_symlinks.py', 'delete_symlinks.py']

"""
    Recursivly delte symbolic links for all files found beneath src_path to
    dst_path. 

"""
def symlink_rec(src_path, dst_path):
    logging.debug("symlink_rec called with %s and %s" % 
            (src_path, dst_path))
    if not os.path.isdir(src_path):
        raise Exception
    for f in os.listdir(src_path):
        if f.startswith('.'):
            continue
        if f not in excludes:
            n_src_path = os.path.join(src_path, f)
            if os.path.isdir(n_src_path):
                n_dst_path = os.path.join(dst_path, f)
                if not os.path.exists(n_dst_path):
                    #nothing to do here
                    continue
                logging.debug("Go down into %s" % (n_src_path))
                symlink_rec(n_src_path, n_dst_path)
                logging.debug("Finished directory %s" % (n_src_path))
            elif os.path.isfile(n_src_path):
                n_dst_path = os.path.join(dst_path, f)
                try:
                    if not os.path.islink(n_dst_path):
                        loggin.warn("Won't delete %s, not a symbolic link"
                                % n_dst_path)
                        continue
                    logging.warn("Removing symbolic link %s" % 
                            (n_dst_path))
                    os.remove(n_dst_path)
                except Exception, msg:
                    logging.error("Failed to delete symlink %s" % 
                            (n_dst_path))
                    logging.error(msg)


"""
    Remove symbolic links from files in <path> to <home> with '.'-prefixed.
    For directories in <path> the '.'-prefixed name will be searched in 
    <home> for further symbolic links to delete.

"""

print "Do you really want to delete all symbolic links in %s to the files in %s ? (YES,No)" % (home, path)

for f in os.listdir(path):
    print f
    if f.startswith('.'):
        continue
    if f not in excludes:
        src_path = os.path.join(path, f)
        if os.path.isdir(src_path):
            logging.debug("Go down into %s" % (src_path))
            dst_path = os.path.join(home, '.' + f)
            if not os.path.exists(dst_path):
                #nothing to delete in here
                continue
            symlink_rec(src_path, dst_path)
            logging.debug("Finished directory %s" % (src_path))
        elif os.path.isfile(src_path):
            dst_path = os.path.join(home, '.' + f)
            if not os.path.islink(dst_path):
                logging.warn("Won't remove %s. Is not a symbolic link")
                continue
            try:
                logging.warn("Remove %s" % (dst_path))
                os.remove(dst_path)
            except Exception, msg:
                logging.error("Failed to remove %s to %s " % 
                        (src_path, dst_path))
                logging.error(msg)
