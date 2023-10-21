#!/bin/sh
sudo apt-get update
sudo apt-get install -y python ccache
mkdir $HOME/chromium && cd $HOME/chromium
fetch --nohooks --no-history chromium
cd $HOME/chromium/src
./build/install-build-deps.sh
gclient runhooks
