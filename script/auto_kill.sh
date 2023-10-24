#!/bin/sh
sleep $(expr 60 \* 60 \* 4 + ${START_TIME}  - $(date "+%s")) && touch "$FLAG_STOP" && ( killall ninja || true ) || ( test $? == 143 && echo sleep canceld ) &
