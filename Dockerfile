FROM golang:1.18-alpine AS GO

WORKDIR /usr/src/app

COPY main.go .
RUN go build main.go

FROM scratch
COPY --from=GO /usr/src/app .

CMD ["./main"]