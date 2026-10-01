# Secure RHEL Departmental File Management & Automated Backup

A Linux system administration project implemented on **Red Hat Enterprise Linux (RHEL) 9.8** to provide departmental storage management, access control, automated backup, and file synchronization.

## Project Overview

This project creates a secure departmental file management environment for Finance and Operations departments.

The project uses **LVM** for storage management, **XFS** for filesystems, Linux users and groups for access control, **Tar** for compressed backups, **Rsync** for file synchronization, and **Crontab** for automated scheduling.

## Technologies Used

- Red Hat Enterprise Linux 9.8
- VMware
- LVM (Logical Volume Manager)
- XFS
- Linux Users & Groups
- File Ownership & Permissions
- Setgid
- Bash Scripting
- Tar
- Rsync
- Crontab

## Project Architecture

A dedicated 20 GB disk was configured using LVM.

The storage was divided into three logical volumes:

**| Logical Volume | Size | Purpose |**

| finance_lv | 7 GB | Finance department data |
| operations_lv | 5 GB | Operations department data |
| backup_lv | 7 GB | Backup and synchronized files |

### Mount Points

text
/company/finance
/company/operations
/company/backup

## Access Control

Linux users and groups were created for Finance, Operations and Backup departments.

File ownership, permissions and Setgid were configured to control departmental access.

## Backup

A Bash script was created at:

/usr/local/bin/vaultflex_backup.sh

The script creates a compressed Tar backup of Finance and Operations data.

It also uses Rsync to synchronize departmental files to the backup directories.

## Automation

The backup script is scheduled using Crontab:

0 20 * * * /usr/local/bin/vaultflex_backup.sh

The script runs automatically every day at 8:00 PM.

## Verification

The project was verified using Linux commands such as:

- ls
- tree
- rsync
- tar
- crontab
- systemctl

## Skills Demonstrated

- Linux System Administration
- LVM Storage Management
- XFS
- User and Group Management
- Linux Permissions
- Bash Scripting
- Tar Backup
- Rsync
- Crontab
- Linux Troubleshooting

## Project Outcome

The project demonstrates a secure departmental file management and automated backup solution on RHEL 9.8 using Linux administration and automation tools.
