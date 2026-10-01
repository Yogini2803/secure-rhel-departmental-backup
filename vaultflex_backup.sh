#!/bin/bash

BACKUP_DIR="/company/backup"
DATE=$(date +%Y-%m-%d)
BACKUP_FILE="$BACKUP_DIR/vaultflex_backup_$DATE.tar.gz"

echo "Starting VaultFlex backup..."
echo "Backup file: $BACKUP_FILE"

# Create compressed Tar backup
tar -czf "$BACKUP_FILE" /company/finance /company/operations

if [ $? -eq 0 ]; then
    echo "Tar backup completed successfully."
else
    echo "Tar backup failed."
    exit 1
fi

# Synchronize Finance files using Rsync
echo "Starting Finance Rsync..."
rsync -av /company/finance/ /company/backup/finance/

if [ $? -eq 0 ]; then
    echo "Finance Rsync completed successfully."
else
    echo "Finance Rsync failed."
    exit 1
fi

# Synchronize Operations files using Rsync
echo "Starting Operations Rsync..."
rsync -av /company/operations/ /company/backup/operations/

if [ $? -eq 0 ]; then
    echo "Operations Rsync completed successfully."
else
    echo "Operations Rsync failed."
    exit 1
fi

echo "VaultFlex backup and synchronization completed successfully."
