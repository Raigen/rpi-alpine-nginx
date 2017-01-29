FROM hypriot/rpi-alpine:3.4
MAINTAINER Raigen

ENV NGINX_VERSION 1.10.1

RUN apk add --update --no-cache nginx

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.vh.default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
