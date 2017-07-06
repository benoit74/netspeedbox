#!/bin/bash

cd "$(dirname "$0")"

source ./nsb_prepare_env.sh

ps -A | grep nsb_launch_probe | grep -v grep | grep -v $$ | awk '{print $1}' |     xargs kill -9

if [ ! -f speedresults.csv ]; then
  ${SPEEDTESTCLI} --csv-header >> speedresults.csv
fi

${SPEEDTESTCLI} --csv >> speedresults.csv
