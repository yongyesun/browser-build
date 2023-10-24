#!/bin/sh
cd "$ROOT"
git clone --depth=1 https://chromium.googlesource.com/chromium/tools/depot_tools.git
export DEPOT_TOOLS_DIR=$PWD/depot_tools
export PATH=$DEPOT_TOOLS_DIR:$PATH
echo "$DEPOT_TOOLS_DIR" >> $GITHUB_PATH
