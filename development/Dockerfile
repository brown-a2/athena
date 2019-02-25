FROM golang:1.11.4

ARG app_env
ENV APP_ENV $app_env
ENV GO111MODULE=on

COPY . /go/src/github.com/brown-a2/athena
WORKDIR /go/src/github.com/brown-a2/athena

COPY go.mod .
COPY go.sum .

RUN go mod download
RUN go get github.com/pilu/fresh
RUN go build

CMD fresh
