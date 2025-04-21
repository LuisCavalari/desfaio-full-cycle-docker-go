FROM golang:1.20-alpine AS builder

WORKDIR /app

COPY . .

RUN go build -o main main.go

FROM scratch AS prod

COPY --from=builder /app/main .

ENTRYPOINT ["./main"]


