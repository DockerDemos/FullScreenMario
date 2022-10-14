# Docker container for FullScreenMario server
# http://www.fullscreenmario.com
FROM centos:latest
LABEL maintainer Chris Collins <collins.christopher@gmail.com>

ENV FSM https://github.com/dignifiedquire/FullScreenMario.git

HEALTHCHECK CMD curl --fail http://localhost/


RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
Run yum -y update
RUN yum install -y epel-release \
      && yum install -y nginx git \
      && yum clean all \
      && rm -rf /var/cache/yum

RUN git clone --depth=1 $FSM /var/www/fsm

# Change the document root to the FSM clone
RUN sed -i 's|/usr/share/nginx/html|/var/www/fsm|' /etc/nginx/nginx.conf

# Change the output of nginx to the console
RUN sed -i 's|/var/log/nginx/error.log|/dev/stderr|' /etc/nginx/nginx.conf
RUN sed -i 's|/var/log/nginx/access.log|/dev/stdout|' /etc/nginx/nginx.conf

# Run nginx in the foreground
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 80

ENTRYPOINT [ "nginx" ]

