#!/bin/bash

# Cleanup for netdata
wget https://raw.githubusercontent.com/netdata/netdata/master/packaging/installer/netdata-uninstaller.sh
chmod +x ./netdata-uninstaller.sh
./netdata-uninstaller.sh --yes --force

# Cleanup for stress
sudo apt-get remove stress -y

# Cleanup for jq
sudo apt-get remove jq -y