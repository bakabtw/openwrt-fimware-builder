#!/bin/bash

PROFILE="xiaomi_mi-router-4c"
PACKAGES=""
FILES="files"
DISABLED_SERVICES=""

OTA_UPDATER_REPO="https://github.com/bakabtw/openwrt-ota-updater.git"
OTA_UPDATER_REPO_DIR="openwrt-ota-updater"

# Cloning or updating git repo
if [ ! -d "./$OTA_UPDATER_REPO_DIR/" ]; then
    echo "Clonning repo ($OTA_UPDATER_REPO)"
    git clone "$OTA_UPDATER_REPO" "$OTA_UPDATER_REPO_DIR" || (echo "ERROR - Couldn't copy a repo ($OTA_UPDATER_REPO)" && exit 1)
else
    echo "Updating repo ($OTA_UPDATER_REPO)"
    cd $OTA_UPDATER_REPO_DIR || return
    git pull || (echo "ERROR - Couldn't update a repo ($OTA_UPDATER_REPO)" && exit 1)
fi

# Cleaning up old files
if [ -d "./files/" ]; then
    rm -rf ./files/*
fi

# Creating file structure
mkdir -p files/etc/crontabs/
mkdir -p files/usr/bin/

# Copying files
cp "./$OTA_UPDATER_REPO_DIR/ota-updater.sh" "./files/usr/bin/ota-updater.sh"
cp "./$OTA_UPDATER_REPO_DIR/crontabs/ota-updater" "./files/etc/crontabs/ota-updater"

# Changing permissions
chmod 755 "./files/usr/bin/ota-updater.sh"
chmod 644 "./files/etc/crontabs/ota-updater"
chown root:root "./files/usr/bin/ota-updater.sh"
chown root:root "./files/etc/crontabs/ota-updater"

# Building firmware
make image PROFILE="$PROFILE" PACKAGES="$PACKAGES" FILES="$FILES" DISABLED_SERVICES="$DISABLED_SERVICES"
