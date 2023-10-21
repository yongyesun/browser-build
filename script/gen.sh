#!/bin/sh
mkdir -p out/Release64/
gn gen out/Release64 --args="is_component_build = false is_official_build = true is_debug = false ffmpeg_branding = \"Chrome\" target_cpu = \"x64\" proprietary_codecs = true media_use_ffmpeg = true enable_widevine = true bundle_widevine_cdm = true enable_media_foundation_widevine_cdm = true enable_nacl=false blink_symbol_level=0 v8_symbol_level=0"
