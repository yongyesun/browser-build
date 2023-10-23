#!/bin/sh
sleep $(expr 60 \* 60 \* 1 + ${START_TIME}  - $(date "+%s")) && touch "$FLAG_STOP" && ( killall ninja-linux64 || true ) || ( test $? == 143 && echo sleep canceld ) &
ps aux | grep 'sleep'
