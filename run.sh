#!/bin/sh

sed -i "s/8080/$PORT/" /app/config.json
sed -i "s/app_passid/$PASSID/" /app/config.json
/app/xray -c /app/config.json
