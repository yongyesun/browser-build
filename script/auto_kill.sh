#!/bin/sh
sleep $(expr 60 \* 6 \* 4 + ${START_TIME}  - $(date "+%s")) && touch "$FLAG_STOP" && ( killall ninja || true ) || ( test $? == 143 && echo sleep canceld ) &
