#!/bin/sh
test -f "$FLAG_STOP" && echo skip && exit 0 || echo ninja start
cp /usr/bin/ccache /usr/local/bin/
ln -s ccache /usr/local/bin/gcc
ln -s ccache /usr/local/bin/g++
cd $ROOT/chromium/src
autoninja -C out/Release64 chrome || ( test $? == 143 && echo ninja canceld )
COUNT=$(ps -C ninja --no-header |wc -l)
if [ $COUNT -eq 0 ]
then
  git config core.ignorecase false
  git config --local user.email "actions@github.com"
  git config --local user.name "GitHub Actions"
  git add "$ROOT/cache"
  git commit -m "$(date '+%Y-%m-%d %H:%M:%S')更新" || echo no change,
  git pull origin main
  git push origin main
fi
