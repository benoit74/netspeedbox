#!/bin/bash

cd "$(dirname "$0")"

source ./nsb_prepare_env.sh

ps -A | grep nsb_send_all_mails | grep -v grep | grep -v $$ | awk '{print $1}' | xargs kill -9

for f in *; do
  case $f in 
    speedresults_*.csv)
      echo Sending $f
      ./nsb_send_one_mail.sh $f
      mv speedresults_$(date +%d-%m-%Y).csv speedresults_$(date +%d-%m-%Y).csv.arch
      ;;
  esac

done

