# Dockerfile for webz-001, webz-002, webz-003
FROM ubuntu:18.04

# Install Apache2, Pacemaker, Corosync, and other necessary tools
RUN apt-get update && apt-get install -y \
    apache2 \
    pacemaker \
    corosync \
    vim \
    iputils-ping \
    pcs

# Copy configuration files for Pacemaker, Corosync, and Apache2
COPY pacemaker.conf /etc/pacemaker/pacemaker.conf
COPY corosync.conf /etc/corosync/corosync.conf
COPY apache2/000-default.conf /etc/apache2/sites-available/000-default.conf

# Enable Apache2 and set it to listen to the Floating IP
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
    a2ensite 000-default && \
    a2enmod rewrite && \
    service apache2 restart

# Expose port 80
EXPOSE 80

# Start Apache2 and the cluster services
CMD service corosync start && \
    service pacemaker start && \
    service apache2 start && \
    tail -f /dev/null

