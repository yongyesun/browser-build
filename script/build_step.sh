#!/bin/sh
test -f "$FLAG_STOP" && echo skip && exit 0 || echo ninja start
cp ccache /usr/local/bin/
ln -s ccache /usr/local/bin/gcc
ln -s ccache /usr/local/bin/g++
cd $ROOT/chromium/src
autoninja -C out/Release64 chrome || ( test $? == 143 && echo ninja canceld )
