#!/bin/sh
test -f "$FLAG_STOP" && echo skip && exit 0 || echo ninja
cd ~/chromium/src
autoninja -C out/Release64 chrome || ( test $? == 143 && echo ninja canceld )
