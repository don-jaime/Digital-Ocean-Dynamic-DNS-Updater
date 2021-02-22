FROM alpine:latest
RUN apk update && apk add curl
RUN echo "* * * * * /usr/local/bin/update-do.sh" >> /etc/crontabs/root
COPY update-do.sh /usr/local/bin/update-do.sh
RUN chmod a+x /usr/local/bin/update-do.sh
CMD crond -f
