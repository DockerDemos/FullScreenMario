# Docker container for FullScreenMario server
# http://www.fullscreenmario.com
#
# Build from lastest tag source code


FROM centos:centos6
MAINTAINER Chris Collins <collins.christopher@gmail.com>

ADD pre-install.sh /pre-install.sh
RUN /pre-install.sh

EXPOSE 80 

CMD ["/sbin/runsvdir-start"]
