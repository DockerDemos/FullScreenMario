# Docker container for FullScreenMario server
# http://www.fullscreenmario.com


FROM centos:centos6
MAINTAINER Chris Collins <collins.christopher@gmail.com>

ENV FSM https://github.com/Diogenesthecynic/FullScreenMario.git

RUN yum install -y httpd php git && yum clean all
RUN git clone $FSM /var/www/html
RUN chmod 755 /var/www/html

EXPOSE 80 

ENTRYPOINT [ "/usr/sbin/httpd", "-DFOREGROUND" ]
