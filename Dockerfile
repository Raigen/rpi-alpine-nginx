FROM hypriot/rpi-alpine:3.4
MAINTAINER Raigen

NGINX_VERSION 1.10.1

RUN apk add --update --no-cache nginx

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
