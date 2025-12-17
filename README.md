````md
# Bash Backup Script

This repository contains a simple Bash backup script created as part of a Linux
and Bash scripting course lab.

The script creates a compressed archive (`.tar.gz`) of all files in a target
directory that were modified within the last 24 hours and moves the backup
archive to a specified destination directory.

---

## Features

- Accepts target and destination directories as command-line arguments
- Validates input arguments and directory paths
- Identifies files modified within the last 24 hours
- Archives selected files using `tar`
- Moves the backup archive to the destination directory

---

## Usage

Make the script executable:

```bash
chmod +x backup.sh
````

Run the script with two arguments:

```bash
./backup.sh <target_directory> <destination_directory>
```

---

## Example

```bash
./backup.sh ~/Documents ~/Backups
```

This command creates a backup archive named similar to:

```text
backup-1700000000.tar.gz
```

The archive will contain only files that were modified in the last 24 hours.

---

## Notes

* This script was developed for educational purposes.
* It is intended to run on Unix-like systems with standard GNU utilities.
* The project follows the structure and requirements provided by the course lab.

---

## Author

Created by Denis Naumov as part of a Linux/Bash scripting course.

````






