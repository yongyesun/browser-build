#!/bin/sh
sleep $(expr 60 \* 60 \* 2 \+ 1800 + ${START_TIME}  - $(date "+%s")) && touch "$FLAG_STOP" && ( killall ninja || true ) || ( test $? == 143 && echo sleep canceld ) &
