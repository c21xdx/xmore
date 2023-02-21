#!/bin/sh

sed -i "s/8080/$PORT/" /app/config.json
sed -i "s/ss_passwd/$PASSID/" /app/config.json
/app/app.js -c /app/config.json
