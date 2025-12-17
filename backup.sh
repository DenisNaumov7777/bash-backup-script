#!/bin/bash

# Check arguments
if [[ $# != 2 ]]; then
  echo "Usage: backup.sh target_directory_name destination_directory_name"
  exit
fi

# Validate directories
if [[ ! -d $1 ]] || [[ ! -d $2 ]]; then
  echo "Invalid directory path provided"
  exit
fi

# Set variables
targetDirectory=$1
destinationDirectory=$2
currentTS=$(date +%s)
backupFileName="backup-$currentTS.tar.gz"
origAbsPath=$(pwd)

# Get absolute path of destination directory
cd "$destinationDirectory" || exit
destAbsPath=$(pwd)

# Go back to target directory
cd "$origAbsPath" || exit
cd "$targetDirectory" || exit

# Timestamp for 24 hours ago
yesterdayTS=$(($currentTS - 24 * 60 * 60))

# Find files modified in the last 24 hours
declare -a toBackup
for file in *; do
  if [[ `date -r "$file" +%s` -gt $yesterdayTS ]]; then
    toBackup+=("$file")
  fi
done

# Create backup archive
tar -czvf "$backupFileName" "${toBackup[@]}"

# Move archive to destination directory
mv "$backupFileName" "$destAbsPath"
