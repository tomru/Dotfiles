#!/usr/bin/env python
import os
import logging


logging.basicConfig(level=logging.WARN)

home = os.path.abspath(os.environ['HOME'])
path = os.path.join(home, '.dotfiles') 
excludes = ['create_symlinks.py', 'delete_symlinks.py']

"""
    Recursivly create symbolic links for all files found beneath src_path to
    dst_path. The directory structure will be created as needed.

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
                logging.debug("Go down into %s" % (n_src_path))
                n_dst_path = os.path.join(dst_path, f)
                if not os.path.exists(n_dst_path):
                    try:
                        logging.warn("Make directory %s" % (n_dst_path))
                        os.mkdir(n_dst_path)
                    except Exception, msg:
                        logging.error("Failed creating directory %s" % 
                                (n_dst_path))
                        logging.error(msg)
                        return # abort or lower levels might fail too 
                symlink_rec(n_src_path, n_dst_path)
                logging.debug("Finished directory %s" % (n_src_path))
            elif os.path.isfile(n_src_path):
                n_dst_path = os.path.join(dst_path, f)
                try:
                    logging.warn("Symlinking %s to %s" % 
                            (n_src_path, n_dst_path))
                    os.symlink(n_src_path, n_dst_path)
                except Exception, msg:
                    logging.error("Failed to symlink %s to %s " % 
                            (n_src_path, n_dst_path))
                    logging.error(msg)


"""
    Create symbolic links from files in <path> to <home> with '.'-prefixed.
    For directories in <path> will be '.'-prefixed created in <home> if 
    needed and symlink_rec is called on them.

"""
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
                try:
                    logging.warn("Make directory %s" % (dst_path))
                    os.mkdir(dst_path)
                except Exception, msg:
                    logging.error("Failed creating directory %s" % 
                            (dst_path))
                    logging.error(msg)
            symlink_rec(src_path, dst_path)
            logging.debug("Finished directory %s" % (src_path))
        elif os.path.isfile(src_path):
            dst_path = os.path.join(home, '.' + f)
            try:
                logging.warn("Symlinking %s to %s" % (src_path, dst_path))
                os.symlink(src_path, dst_path)
            except Exception, msg:
                logging.error("Failed to symlink %s to %s " % 
                        (src_path, dst_path))
                logging.error(msg)
