FROM alpine:3.6

MAINTAINER Zack Shahan <z.shahan@gmail.com>

# install required packages
RUN apk --no-cache add ca-certificates gettext postfix

# copy required files
COPY postfix-main.cf /root/conf/
COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

USER 1001

EXPOSE 2525
ENTRYPOINT ["/entrypoint.sh"]
