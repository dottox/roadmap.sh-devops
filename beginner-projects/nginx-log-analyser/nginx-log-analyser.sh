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


titles=("IP addresses with most requests" "most requested paths" "response status codes" "user agents")
info=$(cat $logfile | awk '{print $1, $7, $9}')

for i in {1..4}; do
  echo "Top 5 ${titles[i-1]}:"
  if [ $i -eq 4 ]; then # user agents works differently
    top=$(cat "$logfile" | awk -F\" -v indx=$i '{print $6}' | sort | uniq -c | sort -nr | head -5)
    awk '{for (i=2; i<=NF; i++) printf $i " "; print "- " $1 " requests"}' <<< "$top"
  else
    top=$(echo "$info" | awk -v indx=$i '{print $indx}' | sort | uniq -c | sort -nr | head -5)
    awk '{print $2" - "$1" requests"}' <<< "$top"
  fi
  echo
done
