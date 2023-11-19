#!/bin/sh
task=$1
if test ! -n "$task"
then
    echo 'usage: build_step.sh <task_name>'
    exit 1
fi
test -f "$FLAG_STOP" && echo skip $task && exit 0 || echo ninja $task
#ls -a /usr/local/bin/
#cp /usr/bin/ccache /usr/local/bin/
#ln -s /usr/local/bin/ccache /usr/local/bin/clang
#ln -s /usr/local/bin/ccache /usr/local/bin/clang++
#ls -a $HOME/.ccache && cat $HOME/.ccache/ccache.conf
ccache -p
cd $ROOT/chromium/src
autoninja -C out/Release64 $task || ( test $? == 143 && echo ninja canceld || echo ninja canceld code $? )
#autoninja -C out/Release64 chrome -j 1 || echo ninja canceld code $?
COUNT=$(ps -C sleep --no-header |wc -l)
if [ $COUNT -eq 0 ]
then
  cd $ROOT
  git config core.ignorecase false
  git config --local user.email "actions@github.com"
  git config --local user.name "GitHub Actions"
  git add "./cache" "./cache_deg"
  git commit -m "$(date '+%Y-%m-%d %H:%M:%S')更新" || echo no change,
  #git pull origin main
  git push origin main || ( git pull --rebase && git push origin main ) 
fi
