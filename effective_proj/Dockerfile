FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y apache2

COPY apache-config/000-default.conf /etc/apache2/sites-available/000-default.conf

RUN echo "Junior DevOps Engineer - Home Task" > /var/www/html/index.html

CMD ["apachectl", "-D", "FOREGROUND"]

