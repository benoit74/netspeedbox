#!/bin/bash

cd "$(dirname "$0")"

source ./nsb_prepare_env.sh

ps -A | grep nsb_daily_operations | grep -v grep | grep -v $$ | awk '{print $1}' |     xargs kill -9

mv speedresults.csv speedresults_$(date +%d-%m-%Y).csv


