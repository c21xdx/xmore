#!/bin/sh

sed -i "s/8080/$PORT/" /app/config.json
sed -i "s/app_passid/$PASSID/" /app/config.json
sed -i "s/warpip/$WARPIP/" /app/config.json
/app/app.js -c /app/config.json
