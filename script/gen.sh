#!/bin/sh
cd $ROOT/chromium/src
mkdir -p out/Release64/
cat out/Release64/args.gn
#gn gen out/Release64 --args="is_component_build = false is_official_build = true is_debug = false ffmpeg_branding = \"Chrome\" target_cpu = \"x64\" proprietary_codecs = true media_use_ffmpeg = true enable_widevine = true bundle_widevine_cdm = true enable_media_foundation_widevine_cdm = true enable_nacl = false symbol_level = 1 cc_wrapper = \"ccache\" target_os = \"win\" chrome_pgo_phase = 0" 
gn gen out/Release64 --args="is_component_build = false is_official_build = true is_debug = false ffmpeg_branding = \"Chrome\" target_cpu = \"x64\" proprietary_codecs = true media_use_ffmpeg = true enable_widevine = true bundle_widevine_cdm = true enable_media_foundation_widevine_cdm = true enable_nacl = false symbol_level = 1 target_os = \"win\" chrome_pgo_phase = 0" 
