#!/bin/sh
mkdir -p out/Release64/
ls
cd /third_party/ffmpeg
git am /path/to/add-hevc-ffmpeg-decoder-parser.patch
gn gen out/arm64/
