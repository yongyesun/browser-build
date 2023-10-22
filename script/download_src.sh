#!/bin/sh
sudo apt-get update
sudo apt-get install -y ccache
mkdir $ROOT/chromium && cd $ROOT/chromium
fetch --nohooks --no-history chromium
cd src
cd third_party/ffmpeg
git am $ROOT/hevc/add-hevc-ffmpeg-decoder-parser.patch
cd $ROOT/chromium/src
cp -R $ROOT/hevc/widevine/* third_party/widevine/cdm
./build/install-build-deps.sh
gclient runhooks
