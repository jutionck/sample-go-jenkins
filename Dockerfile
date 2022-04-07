FROM golang:alpine as build
RUN apk update && apk add --no-cache git
WORKDIR /src
COPY . .
RUN go build -o sample-go-jenkins .
CMD ./sample-go-jenkins