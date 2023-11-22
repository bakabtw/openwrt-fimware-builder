#!/bin/bash

openwrt_version="23.05.0"
imagebuilder_dir="openwrt-imagebuilder-$openwrt_version-ramips-mt76x8.Linux-x86_64"

PROFILE="xiaomi_mi-router-4c"
# Base packages
PACKAGES="bash wget coreutils-sha1sum openssl-util"
# Web GUI packages
PACKAGES="$PACKAGES oui-ui-core oui-app-acl oui-app-backup oui-app-demo oui-app-dhcp-lease oui-app-home oui-app-layout oui-app-login oui-app-stations oui-app-system oui-app-upgrade oui-app-user"
FILES="files"
DISABLED_SERVICES=""

OTA_UPDATER_REPO="https://github.com/bakabtw/openwrt-ota-updater.git"
OTA_UPDATER_REPO_DIR="openwrt-ota-updater"

# Cloning or updating git repo
if [ ! -d "$OTA_UPDATER_REPO_DIR" ]; then
    echo "Clonning repo ($OTA_UPDATER_REPO)"
    git clone "$OTA_UPDATER_REPO" "$OTA_UPDATER_REPO_DIR" || (echo "ERROR - Couldn't copy a repo ($OTA_UPDATER_REPO)" && exit 1)
else
    echo "Updating repo ($OTA_UPDATER_REPO)"
    cd $OTA_UPDATER_REPO_DIR || return
    git pull || (echo "ERROR - Couldn't update a repo ($OTA_UPDATER_REPO)" && exit 1)
    cd ..
fi

# Cleaning up old files
if [ -d "$imagebuilder_dir/files/" ]; then
    echo "Cleaning up old files..."
    rm -rf $imagebuilder_dir/files/*
fi

# Creating file structure
mkdir -p "$imagebuilder_dir/files/etc/crontabs/"
mkdir -p "$imagebuilder_dir/files/usr/bin/"

# Copying files
cp "$OTA_UPDATER_REPO_DIR/ota-updater.sh" "$imagebuilder_dir/files/usr/bin/ota-updater.sh"
cp "$OTA_UPDATER_REPO_DIR/crontabs/ota-updater" "$imagebuilder_dir/files/etc/crontabs/ota-updater"

# Changing permissions
chmod 755 "$imagebuilder_dir/files/usr/bin/ota-updater.sh"
chmod 644 "$imagebuilder_dir/files/etc/crontabs/ota-updater"
chown root:root "$imagebuilder_dir/files/usr/bin/ota-updater.sh"
chown root:root "$imagebuilder_dir/files/etc/crontabs/ota-updater"

# Building firmware
cd $imagebuilder_dir && make image PROFILE="$PROFILE" PACKAGES="$PACKAGES" FILES="$FILES" DISABLED_SERVICES="$DISABLED_SERVICES"
