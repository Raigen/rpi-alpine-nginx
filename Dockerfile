FROM hypriot/rpi-alpine:3.5
MAINTAINER Raigen

ENV NGINX_VERSION 1.10.2

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="Nginx" \
      org.label-schema.description="Nginx based on hypriot-alpine" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/Raigen/rpi-alpine-nginx"

RUN apk add --update --no-cache nginx

RUN mkdir -p /usr/share/nginx/html

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.vh.default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
