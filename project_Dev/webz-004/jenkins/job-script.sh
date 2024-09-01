#!/bin/bash
# Script to send cURL request to the floating IP and log the response

FLOATING_IP="192.168.0.100"  # Replace with your floating IP
PORT=80
LOG_FILE="/var/log/jenkins/floating_ip_response.log"
CONTAINER_NAME=$(hostname)

# Send cURL request
RESPONSE=$(curl -s http://$FLOATING_IP:$PORT)

# Log the response
echo "$(date) - $CONTAINER_NAME - $RESPONSE" >> $LOG_FILE
