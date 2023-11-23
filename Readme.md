# OpenWRT firmware builder scipts
A set of scripts to setup Image Builder, copy necessary custom files and build an image.

# Prerequsites
It's important to install necessary packages in advance since the scipt should NOT be run as ROOT.

## Debian/Ubuntu
```
sudo apt install build-essential libncurses-dev zlib1g-dev gawk git gettext libssl-dev xsltproc rsync wget unzip python3 python3-distutils liblzma-dev python3-magic
```

# Image Builder setup
Once you installed necessary packages, please run `setup.sh`

```
bash setup.sh
```

The script will download and unpack Image Builder for `mt76x8` architecture.

# Building firmware
To build a new firmware file, simply run:
```
bash build-firmware.sh
```

If there's no error during compilation, the firmware files will be located at ``
```
openwrt-imagebuilder-23.05.0-ramips-mt76x8.Linux-x86_64/bin/targets/ramips/mt76x8/openwrt-23.05.0-ramips-mt76x8-xiaomi_mi-router-4c-squashfs-sysupgrade.bin
```

# TODO
- Add config for `ota-updater`
- Add support for building dev images (generic arch)
- Code cleanup
- Add pipeline for `luci-theme-argon`
- Add mirrors for repo
