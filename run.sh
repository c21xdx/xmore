#!/bin/sh

sed -i "s/10086/$PORT/" /v2ray/ws4ss2.json
sed -i "s/ss_passwd/$SS_PASSWD/" /v2ray/ws4ss2.json
/v2ray/v2ray -config /v2ray/ws4ss2.json
