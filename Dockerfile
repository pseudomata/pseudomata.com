FROM caddy:2-alpine

COPY ./Caddyfile /etc/caddy/Caddyfile

COPY ./static/ /usr/share/caddy/
