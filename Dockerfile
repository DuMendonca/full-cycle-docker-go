FROM golang:alpine AS builder

WORKDIR /usr/src/app

RUN go mod init exemple/app

COPY . .
RUN go build
RUN export PATH=$PATH:/usr/src/app

FROM scratch
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app .
EXPOSE 3000
ENTRYPOINT ["./app"]