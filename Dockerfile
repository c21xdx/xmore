FROM --platform=linux/arm64 arm64v8/alpine:latest

ENV PORT 8080
ENV PASSID e7d5d38c-e518-42d6-a46f-c14a3f324c69

USER root

COPY config.json run.sh /etc/

RUN apk upgrade --update \
    && apk add \
        bash \
        curl \
    # Install app
    && mkdir /app \
    && curl -L -H "Cache-Control: no-cache" -o /app/xray.zip https://github.com/XTLS/Xray-core/releases/download/v24.11.11/Xray-linux-arm64-v8a.zip \
    && unzip /app/xray.zip -d /app/ && mv /etc/config.json /app/ && chmod +x /app/* \
    # clear
    && apk del curl && rm -rf /var/cache/apk/* /app/xray.zip

EXPOSE $PORT
    
CMD sh /etc/run.sh
