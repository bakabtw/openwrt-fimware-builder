#!/bin/bash

##############
##
## Simple script to download and unpack Image Builder for mt76x8 arch
##
##############

openwrt_version="23.05.0"
imagebuilder_dir="openwrt-imagebuilder-$openwrt_version-ramips-mt76x8.Linux-x86_64"
imagebuilder_file="$imagebuilder_dir.tar.xz"
imagebuilder_url="https://downloads.openwrt.org/releases/$openwrt_version/targets/ramips/mt76x8/$imagebuilder_file"
imagebuilder_sha256sum_url="https://downloads.openwrt.org/releases/$openwrt_version/targets/ramips/mt76x8/sha256sums"

if [ ! -d "./$imagebuilder_dir/" ]; then
    wget -c $imagebuilder_url || (echo "ERROR - Couldn't download Image Builder ($imagebuilder_url)" && exit 1)
    wget -c $imagebuilder_sha256sum_url || (echo "ERROR - Couldn't download sha256sums ($imagebuilder_url)" && exit 1)
    echo "Download complete"
    
    echo "Unpacking files..."
    tar -xJf $imagebuilder_file || (echo "ERROR - Couldn't unpack the archive ($imagebuilder_file)" && exit 1)
    echo "Image Builder was sucessfully installed."
else
    echo "Image Builder dir already exists. Please remove it before launching 'setup.sh'."
    exit 1
fi
