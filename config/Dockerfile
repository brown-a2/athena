FROM nginx:1.15.8-alpine

RUN apk update && apk add --no-cache git bash wget curl

VOLUME ["/vol-nginx"]

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
