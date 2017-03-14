FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

ADD web/ /var/www/html/
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
