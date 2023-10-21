#!/bin/sh
sudo apt-get update
sudo apt-get install -y python ccache
mkdir $ROOT/chromium && cd $ROOT/chromium
fetch --nohooks --no-history chromium
cd src
./build/install-build-deps.sh
gclient runhooks
