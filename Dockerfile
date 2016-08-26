FROM golang:latest

RUN apt-get update && apt-get install -qy libsystemd-dev

WORKDIR /usr/src/journald-cloudwatch-logs
ENV "GOPATH=/go:/usr"
RUN mkdir -p /usr/src/journald-cloudwatch-logs
COPY *.go /usr/src/journald-cloudwatch-logs/
RUN go get && \
rm -rf /usr/src/journald-cloudwatch-logs/

VOLUME /usr/src/journald-cloudwatch-logs
CMD go build
