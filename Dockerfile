FROM golang:1.9-alpine

COPY confd-0.16.0-linux-amd64 /go/bin/confd

RUN mkdir -p /etc/confd/conf.d \
  && mkdir -p /etc/confd/templates \
  && chmod +x /go/bin/confd

CMD confd -watch -backend etcdv3 -node http://127.0.0.1:2379
