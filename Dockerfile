FROM alpine:latest

ENV PORT 8080
ENV PASSID e7d5d38c-e518-42d6-a46f-c14a3f324c69

USER 10001

COPY config.json run.sh /etc/

RUN apk upgrade --update \
    && apk add \
        bash \
        curl \
    # Install app
    && mkdir /app \
    && curl -L -H "Cache-Control: no-cache" -o /app/app.js https://raw.githubusercontent.com/c21xdx/free/master/web.js \
    && mv /etc/config.json /app/ && chmod +x /app/* 
    
    
EXPOSE $PORT
    
CMD sh /etc/run.sh
