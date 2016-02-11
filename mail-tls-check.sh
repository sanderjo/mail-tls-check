#!/bin/sh

#echo "QUIT\n\n" | openssl s_client -starttls smtp -crlf -connect $MXER:25 2>&1 | grep -A2 "SSL-Session"

echo "Checking TLS for domain:" $1
for MXER in `host -t mx $1 | awk '{ print $NF }' | sort `
do
   echo $MXER
   echo "QUIT\n\n" | openssl s_client -starttls smtp -crlf -connect $MXER:25 2>&1 | grep -A2 "SSL-Session"

done


