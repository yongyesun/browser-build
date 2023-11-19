#!/bin/sh
sleep $(expr 60 \* 15 \* 2 + ${START_TIME}  - $(date "+%s")) && touch "$FLAG_STOP" && ( killall ninja || true ) || ( test $? == 143 && echo sleep canceld ) &
