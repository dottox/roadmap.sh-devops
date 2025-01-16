#!/bin/bash

logfile=$1

if [[ ! -f $logfile || -z $logfile ]]; then
    echo "Usage: $0 <log-file>"
    exit 1
fi


echo
echo "######################"
echo "# Nginx Log Analyser #"
echo "######################"
echo 


titles=("IP addresses with most requests" "most requested paths" "response status codes")
info=$(cat $logfile | awk '{print $1, $7, $9}')

for i in {1..3}; do
  echo "Top 5 ${titles[i-1]}:"
  top=$(echo "$info" | awk -v indx=$i '{print $indx}' | sort | uniq -c | sort -nr | head -5)
  awk '{print $2" - "$1" requests"}' <<< "$top"
  echo
done