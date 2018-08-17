FROM alpine:latest
MAINTAINER aaron@signalsciences.com

RUN apk add --no-cache curl
RUN curl https://dl.signalsciences.net/sigsci-agent/sigsci-agent_latest.tar.gz | tar -zxf - -C /usr/sbin/

CMD /usr/sbin/sigsci-agent