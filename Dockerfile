FROM alpine:latest

RUN adduser -D -u 1000 -g 1000 -s /bin/sh www

RUN apk update && apk add --no-cache g++ make bash

COPY ./webserv /app/
COPY ./config/Default.conf /app/config/
COPY ./static /app/static/

WORKDIR /app
RUN make

RUN chown -R www:www /app
USER www

CMD ["./webserv", "/app/config/Default.conf"]
