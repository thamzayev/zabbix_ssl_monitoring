#!/bin/bash

HOST=$1
PORT=${2:-443}

if [[ -z "$HOST" ]]; then
    echo "Usage: $0 <hostname> [port]"
    exit 1
fi

# Extract expiration date and convert to epoch
end_date=$(echo | openssl s_client -servername "$HOST" -connect "$HOST:$PORT" 2>/dev/null | openssl x509 -noout -enddate | cut -d= -f2)
if [[ -z "$end_date" ]]; then
    echo "Error retrieving certificate for $HOST"
    exit 2
fi

end_date_epoch=$(date -d "$end_date" +%s)
now_epoch=$(date +%s)
days_left=$(( (end_date_epoch - now_epoch) / 86400 ))

echo $days_left
