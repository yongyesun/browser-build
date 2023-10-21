#!/bin/sh
sudo apt-get update
sudo apt-get install -y python ccache
mkdir ~/chromium && cd ~/chromium
fetch --nohooks --no-history chromium
cd "$ROOT/src"
./build/install-build-deps.sh
gclient runhooks
