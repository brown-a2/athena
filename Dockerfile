# Image one - build GO binary
FROM golang:1.11.4-alpine3.8 AS builder
RUN apk update && apk add --no-cache git ca-certificates tzdata && update-ca-certificates
RUN adduser -D -g '' appuser
COPY . $GOPATH/src/github.com/brown-a2/athena/
WORKDIR  $GOPATH/src/github.com/brown-a2/athena/
ENV GO111MODULE=on
RUN go mod download
RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -ldflags="-w -s" -o /go/bin/athena

# Image two
FROM scratch
COPY --from=builder /usr/share/zoneinfo /usr/share/zoneinfo
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /go/bin/athena /go/bin/athena
USER appuser
EXPOSE 8080
ENTRYPOINT ["/go/bin/athena"]
