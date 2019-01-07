FROM golang:1.7.4
MAINTAINER brown-a2

ENV SOURCES /go/src/athena

COPY . ${SOURCES}

RUN cd ${SOURCES} && CGO_ENABLED=0 go install

ENV PORT 8080
EXPOSE 8080

ENTRYPOINT athena
