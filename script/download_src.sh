#!/bin/sh
sudo apt-get update
sudo apt-get install -y ccache
git clone --depth=1 https://github.com/StaZhu/enable-chromium-hevc-hardware-decoding.git $ROOT/hevc
mkdir $ROOT/chromium && cd $ROOT/chromium
fetch --nohooks --no-history chromium
sed -i 's/"checkout_pgo_profiles": False/"checkout_pgo_profiles": True/g .gclient
cd src
cd third_party/ffmpeg
git am $ROOT/hevc/add-hevc-ffmpeg-decoder-parser.patch
cd $ROOT/chromium/src
cp -R $ROOT/hevc/widevine/* third_party/widevine/cdm
./build/install-build-deps.sh
gclient runhooks
