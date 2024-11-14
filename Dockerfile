FROM golang:alpine AS builder

RUN apk add --no-cache build-base upx

WORKDIR /app

COPY . .

RUN go mod init main && \
    CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags="-w -s" -o main .

RUN upx --best --ultra-brute main

FROM scratch

COPY --from=builder /app/main /main

ENTRYPOINT [ "/main" ]