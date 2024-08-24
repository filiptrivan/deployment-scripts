#!/bin/bash

APP_NAME="$1"
DEPLOY_PATH="$2"
BACKUP_PATH="$3"

if [ -z "$APP_NAME" ]; then
    echo "Error: The application name must be provided."
    exit 1
fi

if [ -z "$DEPLOY_PATH" ]; then
    echo "Error: The deployment path must be provided."
    exit 1
fi

if [ -z "$BACKUP_PATH" ]; then
    echo "Error: The backup path must be provided."
    exit 1
fi

if [ "$(id -u)" -ne 0 ]; then
    echo "This script requires root privileges. Please run as root or with sudo."
    exit 1
fi

if [ -d "$BACKUP_PATH" ]; then
    echo "Backing up current application to: $BACKUP_PATH"
    rm -rf "$BACKUP_PATH"
fi
cp -r "$DEPLOY_PATH" "$BACKUP_PATH"
echo "Backed up current application to: $BACKUP_PATH"

# Stop
echo "Stopping Apache service"
systemctl stop apache2

echo "Updating application files in: $DEPLOY_PATH"
rm -rf "$DEPLOY_PATH"/*
cp -r "$DEPLOY_PATH"/* "$DEPLOY_PATH"

# Start
echo "Starting Apache service"
systemctl start apache2

echo "Deployment completed successfully."
