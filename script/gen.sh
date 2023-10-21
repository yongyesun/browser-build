#!/bin/sh
cd ~/chromium/src
mkdir -p out/Release64/
ls
cd /third_party/ffmpeg
ls
git am /path/to/add-hevc-ffmpeg-decoder-parser.patch
cd ~/chromium/src
cp -R /path/to/widevine/* third_party/widevine/cdm
gn gen out/Release64 --args="is_component_build = false is_official_build = true is_debug = false ffmpeg_branding = \"Chrome\" target_cpu = \"x64\" proprietary_codecs = true media_use_ffmpeg = true enable_widevine = true bundle_widevine_cdm = true enable_media_foundation_widevine_cdm = true"
