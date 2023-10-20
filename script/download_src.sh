#!/bin/sh
sudo apt-get update
sudo apt-get install -y ccache
mkdir ~/chromium && cd ~/chromium
fetch --nohooks --no-history chromium
cd src
./build/install-build-deps.sh
gclient runhooks
