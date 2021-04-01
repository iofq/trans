FROM alpine:latest

ENV S6_VERSION=v2.2.0.0
#openvpn
RUN apk add --no-cache --update openvpn
VOLUME ["/ovpn"]

#s6-overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/${S6_VERSION}/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

#transmission
RUN apk add --no-cache --update transmission-cli transmission-daemon bash curl
RUN adduser -D trans
VOLUME ["/config", "/downloads","/watch"]

# copy overlay
COPY root/ /

EXPOSE 9091

HEALTHCHECK --interval=240s --timeout=15s --start-period=20s \
  CMD sh /app/healthcheck.sh

ENTRYPOINT ["/init"]
