#!/bin/python
import sys
import os

home_dir = os.path.expanduser('~')
backup_path = os.path.join(home_dir, '.old_config')
os.mkdir(backup_path)


rec_dirs = ["config", "fonts"]



paths = [(os.path.join(os.getcwd(), dir_item), 
    os.path.join(backup_path, dir_item), 
    os.path.join(home_dir, '.' + dir_item))
    for dir_item in os.listdir() if not dir_item.startswith('.') and not dir_item.endswith('.py')] 

for new, backup, orig in paths:
    os.rename(orig, backup)
    os.symlink(new, orig)
