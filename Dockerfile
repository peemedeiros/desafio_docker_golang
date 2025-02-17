FROM golang AS build

WORKDIR /go/app

COPY ./hello.go .

RUN go build -ldflags "-w -s" -o hello hello.go

FROM scratch
COPY --from=build /go/app/hello .
CMD ["./hello"]