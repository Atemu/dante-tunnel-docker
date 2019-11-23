FROM alpine

RUN echo "https://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --no-cache dante-server curl

COPY sockd.conf /etc/

CMD until [ -d /sys/class/net/tun0 ] ; do sleep 1 ; done && sockd

HEALTHCHECK --interval=60s --timeout=15s --start-period=120s \
             CMD curl -L 'https://api.ipify.org'
