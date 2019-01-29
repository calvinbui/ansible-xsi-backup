#!/usr/bin/env python
"""Removes old backups keeping only the newest specified amount"""
import argparse
import glob
import os
import shutil

PARSER = argparse.ArgumentParser(description="Delete old backups")
PARSER.add_argument("-p", "--path", required=True, type=str, help="path where backups are stored")
PARSER.add_argument("-r", "--regex", required=True, type=str, help="pattern of backup folders to match")
PARSER.add_argument("-k", "--keep", required=True, help="how many backups to keep", default=5, type=int,)
ARGS = PARSER.parse_args()

BACKUPS = glob.glob(ARGS.path + "/" + ARGS.regex) # search
if not BACKUPS:
    print("Could not find any matching files or folders")
    exit(-1)
BACKUPS.sort(key=os.path.getctime, reverse=True) # sort by date created
BACKUPS = [os.path.abspath(BACKUP) for BACKUP in BACKUPS] # get absolute path for all

BACKUPS_TO_KEEP = BACKUPS[:ARGS.keep]
BACKUPS_TO_DELETE = BACKUPS[ARGS.keep:]

for BACKUP in BACKUPS_TO_KEEP:
    print("Keeping {}".format(BACKUP))

for BACKUP in BACKUPS_TO_DELETE:
    try:
        print("Removing {}".format(BACKUP))
        if os.path.isfile(BACKUP):
            os.remove(BACKUP)
        elif os.path.isdir(BACKUP):
            shutil.rmtree(BACKUP)
        else:
            raise OSError("Not a file or directory")
    except OSError as error:
        print("Error: {} - {}.".format(error.filename, error.strerror))
