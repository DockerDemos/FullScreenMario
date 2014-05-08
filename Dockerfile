# Dockerfile for Duke Webservices Drupal install
# 2014-04-11
#

FROM centos
MAINTAINER Chris Collins <collins.christopher@gmail.com>

ADD pre-install.sh /pre-install.sh
RUN /pre-install.sh

EXPOSE 80 

CMD ["/sbin/runsvdir-start"]
