FROM golang:latest

ENV CGO_ENABLED=0 \
    GOPATH=/go \
    PATH=$PATH:/go/bin

ADD build.sh /tmp/build.sh


RUN chmod +x /tmp/build.sh && /tmp/build.sh

