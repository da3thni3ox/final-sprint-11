FROM golang:1.22.0 AS build
COPY ./ /build/

WORKDIR /build

RUN go build -o application .

FROM golang:1.22.0

COPY --from=build /build/application /app/
COPY --from=build /build/tracker.db /app/

WORKDIR /app

CMD [ "./application" ]