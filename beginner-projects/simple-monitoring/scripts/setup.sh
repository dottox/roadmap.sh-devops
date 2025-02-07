#!/bin/bash

# Setup for netdata
wget -O /tmp/netdata-kickstart.sh https://get.netdata.cloud/kickstart.sh && yes | sh /tmp/netdata-kickstart.sh
