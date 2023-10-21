#!/bin/sh
cd $ROOT/chromium/src
mkdir -p out/Release64/
ls
cd third_party/ffmpeg
ls
git am $HOME/hevc/add-hevc-ffmpeg-decoder-parser.patch
cd $ROOT/chromium/src
cp -R $HOME/hevc/widevine/* third_party/widevine/cdm
gn gen out/Release64 --args="is_component_build = false is_official_build = true is_debug = false ffmpeg_branding = \"Chrome\" target_cpu = \"x64\" proprietary_codecs = true media_use_ffmpeg = true enable_widevine = true bundle_widevine_cdm = true enable_media_foundation_widevine_cdm = true"
