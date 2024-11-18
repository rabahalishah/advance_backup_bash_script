#!/bin/bash

# Check to make sure that the user has exactly entered the two arguments

if [ $# -ne 2 ]
then 
     echo "Usage: backup_script.sh requires 2 arguments, <source_dir> <target_dir>, But provided $# arguments."
     echo "Please try again."
     exit 1
fi

# Check to see if rsync is installed.
if ! command -v rsync > /dev/null 2>&1
then
   echo "This script required rsync to be installed."
   echo "Please use your distribution's package manager to install rsync."
   exit 2
fi

# capture th current date, and store it in the format YYYY-MM-DD
current_date=$(data +%Y-%m-%d)

rsync_option="-avb --backup-dir $2/current_date --delete --dry-run"

$(which rsync) $rsync_options $1 $2/current >> backup_$current_date.log

