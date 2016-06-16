FROM python:3.5-alpine
MAINTAINER MrRaph_ "mrrpah_@techan.fr"

ADD start_runit /sbin/

RUN 	mkdir /etc/container_environment &&\
        chmod a+x /sbin/start_runit && mkdir /etc/service && mkdir /etc/runit_init.d && \
        echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
        apk --update upgrade && apk add --update python python-dev gfortran py-pip build-base runit && rm -rf /var/cache/apk/*

ADD service/firstrun.runit /etc/service/
WORKDIR /usr/src/app

CMD ["/sbin/start_runit"]
