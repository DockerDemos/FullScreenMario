# Docker container for FullScreenMario server
# http://www.fullscreenmario.com
FROM centos:latest
LABEL maintainer Chris Collins <collins.christopher@gmail.com>

ENV FSM https://github.com/dignifiedquire/FullScreenMario.git

RUN yum install -y epel-release \
      && yum install -y nginx git \
      && yum clean all \
      && rm -rf /var/cache/yum

RUN git clone --depth=1 $FSM /var/www/fsm

RUN sed -i 's|/usr/share/nginx/html|/var/www/fsm|' /etc/nginx/nginx.conf

EXPOSE 80

ENTRYPOINT [ "nginx" ]

