#!/bin/sh
git clone --depth=1 https://github.com/StaZhu/enable-chromium-hevc-hardware-decoding.git $ROOT/hevc
mkdir $ROOT/chromium && cd $ROOT/chromium
#fetch --nohooks --no-history chromium
#git clone --depth 1 --branch="$STABLE_VERSION" "https://github.com/chromium/chromium.git" src
gclient root
gclient config --name=src --unmanaged "https://github.com/chromium/chromium.git"
sed -i 's/"custom_vars": {/"custom_vars": {\r\n      "checkout_pgo_profiles": True,\r\n    /g' .gclient
sed -i '$a target_os = ['\''win'\'']' .gclient
#echo 'target_os = ["win"]' >> .gclient
cat $ROOT/chromium/.gclient
gclient sync --nohooks --no-history --revision "$STABLE_VERSION"
git config diff.ignoreSubmodules dirty
mkdir $ROOT/chromium/win
wget -P $ROOT/chromium/win https://github.com/Alex313031/Snippets/releases/download/10.1.22621.1778-1/7eee888925.zip -q
export DEPOT_TOOLS_WIN_TOOLCHAIN_BASE_URL=$ROOT/chromium/win/
export GYP_MSVS_HASH_27370823e7=7eee888925
cd $ROOT/chromium/src/third_party/ffmpeg
##cd third_party/ffmpeg
git am $ROOT/hevc/add-hevc-ffmpeg-decoder-parser.patch
cd $ROOT/chromium/src
cp -R $ROOT/hevc/widevine/* third_party/widevine/cdm
#./build/install-build-deps.sh
sudo bash ./build/install-build-deps.sh --no-chromeos-fonts --no-android
gclient runhooks
#cd $ROOT/chromium
#python3 src/v8/tools/builtins-pgo/download_profiles.py download --depot-tools src/third_party/depot_tools --version 11.9.169.6
