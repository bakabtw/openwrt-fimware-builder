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
