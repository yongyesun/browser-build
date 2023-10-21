#!/bin/sh
test -f "$FLAG_STOP" && echo skip && exit 0 || echo ninja start
cd ~/chromium/src
autoninja -C out/Release64 chrome || ( test $? == 143 && echo ninja canceld )
git config core.ignorecase false
git config --local user.email "actions@github.com"
git config --local user.name "GitHub Actions"
cd "$HOME/cache"
git add .
git commit -m "$(date '+%Y-%m-%d %H:%M:%S')更新" || echo no change,
git pull origin main
git push origin main
