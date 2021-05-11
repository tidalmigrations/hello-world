FROM --platform=$BUILDPLATFORM golang:alpine AS builder

ADD main.go /
RUN go build -o /app /main.go

FROM scratch
COPY --from=builder /app /app
CMD ["/app"]
