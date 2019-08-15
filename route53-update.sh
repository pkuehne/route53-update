#!/bin/bash

TTL="${TTL:-600}"
DELAY="${DELAY:-3600}"

while :
do
    IP=`curl http://ifconfig.co/ 2>/dev/null`
    echo `date` "Started updating the DNS Zone for $IP"

    aws route53 change-resource-record-sets --hosted-zone-id $AWS_ROUTE53_ZONEID --change-batch "{ \"Changes\": [ { \"Action\": \"UPSERT\", \"ResourceRecordSet\": { \"Name\": \"$DOMAIN\", \"Type\": \"A\", \"TTL\": $TTL, \"ResourceRecords\": [ { \"Value\": \"$IP\" } ] } } ] }"

    if [[ $? -eq 0 ]]; then
        echo `date` "Updated $DOMAIN to $IP"
    else
        echo `date` "Failed to update $HOSTNAME"
    fi

    echo `date` "Completed updating the DNS Zone"
    sleep "$DELAY"
done
