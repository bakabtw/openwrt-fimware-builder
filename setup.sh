#!/bin/bash

imagebuilder_url="https://downloads.openwrt.org/releases/23.05.0/targets/ramips/mt76x8/openwrt-imagebuilder-23.05.0-ramips-mt76x8.Linux-x86_64.tar.xz"
imagebuilder_sha256sum_url="https://downloads.openwrt.org/releases/23.05.0/targets/ramips/mt76x8/sha256sums"

wget -c $imagebuilder_url
wget -c $imagebuilder_sha256sum_url

tar xJf openwrt-imagebuilder-*.tar.xz

