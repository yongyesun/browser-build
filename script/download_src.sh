#!/bin/sh
git clone --depth=1 https://github.com/StaZhu/enable-chromium-hevc-hardware-decoding.git $ROOT/hevc
mkdir $ROOT/chromium && cd $ROOT/chromium
#fetch --nohooks --no-history chromium
git clone --depth 1 --branch="$STABLE_VERSION" "https://github.com/chromium/chromium.git" src
gclient config --spec 'solutions = [\r\n  {\r\n    "name": "src",\r\n    "url": "https://chromium.googlesource.com/chromium/src.git",\r\n    "managed": False,\r\n    "custom_deps": {},\r\n    "custom_vars": {\r\n      "checkout_pgo_profiles": True,\r\n    },\r\n  },\r\n]\r\ntarget_os = ['win']\r\n'
#sed -i 's/"custom_vars": {/"custom_vars": {\r\n"checkout_pgo_profiles": True,\r\n    /g' .gclient
#sed -i '$a target_os = ['\''win'\'']' .gclient
cat $ROOT/chromium/.gclient
gclient sync --nohooks --no-history
git config --global diff.ignoreSubmodules dirty
mkdir $ROOT/chromium/win
wget -P $ROOT/chromium/win https://github.com/Alex313031/Snippets/releases/download/10.1.22621.1778-1/7eee888925.zip -q
export DEPOT_TOOLS_WIN_TOOLCHAIN_BASE_URL=$ROOT/chromium/win/
export GYP_MSVS_HASH_27370823e7=7eee888925
cd $ROOT/chromium/src
cd third_party/ffmpeg
git am $ROOT/hevc/add-hevc-ffmpeg-decoder-parser.patch
cd $ROOT/chromium/src
cp -R $ROOT/hevc/widevine/* third_party/widevine/cdm
./build/install-build-deps.sh
gclient runhooks
