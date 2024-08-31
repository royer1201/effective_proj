#!/bin/bash

FLOATING_IP="your_floating_ip_here"
PORT="80"
LOG_FILE="/var/log/jenkins/floating_ip_response.log"

# Ensure log file exists
touch $LOG_FILE

# Run cURL command and append the result to the log file
while true; do
    RESPONSE=$(curl -s "$FLOATING_IP:$PORT")
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    CONTAINER_NAME=$(hostname)
    echo "$TIMESTAMP - $CONTAINER_NAME - $RESPONSE" >> $LOG_FILE
    sleep 300
done

