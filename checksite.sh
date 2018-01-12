#!/bin/bash
# (c) 2018 Steven Harradine
site=$1
cachedHash=`cat /tmp/sitehash`
newHash=`curl $site | md5sum | cut -d' ' -f1`

email_to=$2
email_from=$3
email_config_user=$4
email_config_password=$5

email_subject="New update to the page $site"
email_body="New update to the page $site"

if [[ "$cachedHash" == "$newHash" ]]; then
        echo "no change"
else    
        echo "Missmatch"
        echo "$newHash" > /tmp/sitehash
        sendEmail -f $email_from -t $email_to -u $email_subject -s smtp.gmail.com:587 -o tls=yes -xu $email_config_user -xp email_config_password -m $email_body
fi