#!/bin/sh
test -f "$FLAG_STOP" && echo skip && exit 0 || echo ninja start
#cp /usr/bin/ccache /usr/local/bin/
#ln -s /usr/local/bin/ccache /usr/local/bin/gcc
#ln -s /usr/local/bin/ccache /usr/local/bin/g++
cd $ROOT/chromium/src
autoninja -C out/Release64 chrome || echo ninja canceld code $?
COUNT=$(ps -C sleep --no-header |wc -l)
if [ $COUNT -eq 0 ]
then
  cd $ROOT/cache && ls -a && echo "/nls ccache"
  cd $ROOT
  git config core.ignorecase false
  git config --local user.email "actions@github.com"
  git config --local user.name "GitHub Actions"
  git add "./cache"
  git commit -m "$(date '+%Y-%m-%d %H:%M:%S')更新" || echo no change,
  git pull origin main
  git push origin main
fi
