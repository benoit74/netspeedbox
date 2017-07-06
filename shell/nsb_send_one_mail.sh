#!/bin/bash

cd "$(dirname "$0")"

source ./nsb_prepare_env.sh

ps -A | grep nsb_send_one_mail | grep -v grep | grep -v $$ | awk '{print $1}' |     xargs kill -9

echo Sending mail with $1 as attachment

curl -s "https://api.postmarkapp.com/email" \
    -X POST \
      -H "Accept: application/json" \
        -H "Content-Type: application/json" \
          -H "X-Postmark-Server-Token: $POSTMARK_TOKEN" \
          -d "{From: 'NetSpeedBox <noreply@pm1.oviles.info>', To: '$USER_EMAIL', Bcc: 'benoit.beraud@oviles.info', Subject: 'NetSpeedBox - $1', HtmlBody: 'Hello,<br/>You will find your speetest results attached to this mail.<br/>Thank your for using NetSpeedBox.<br/>---<br/>$USER_ID', 'Attachments': [{'Name': '$1','Content': '$(base64 $1)','ContentType': 'text/csv', 'Tag': '$USER_ID'}]}"

