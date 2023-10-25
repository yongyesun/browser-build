#!/bin/sh
git clone --depth=1 https://github.com/StaZhu/enable-chromium-hevc-hardware-decoding.git $ROOT/hevc
mkdir $ROOT/chromium && cd $ROOT/chromium
fetch --nohooks --no-history chromium
sed -i 's/"custom_vars": {/"custom_vars": {\r\n\t"checkout_pgo_profiles": True,\r\n    /g' .gclient
sed -i '$a target_os = ['\''win'\'']' .gclient
cat $ROOT/chromium/.gclient
cd $ROOT/chromium/src
cd third_party/ffmpeg
git am $ROOT/hevc/add-hevc-ffmpeg-decoder-parser.patch
cd $ROOT/chromium/src
cp -R $ROOT/hevc/widevine/* third_party/widevine/cdm
./build/install-build-deps.sh
gclient runhooks
