#!/bin/bash

INFO=$(top -l 1 -n 0)

echo
echo "######################"
echo "# Server Perf. Stats #"
echo "######################"
echo 

date

echo 

echo "- Total CPU usage: " $(echo "$INFO" | grep "CPU usage:" | awk '{print $3 + $5"%"}')
echo "- Total Memory usage: " $(echo "$INFO" | grep "PhysMem:" | awk '{print $2" used"}')
echo "- Total Disk usage: " $(df -h / | tail -1 | awk '{printf ("%.2f",$4*100/$2); print "% ("$4" of "$2")"}')

echo 

echo "Top 5 proccess by CPU: "
top -l 2 -n 5 -stats pid,command,cpu -o cpu | tail -6 | awk {print}

echo

echo "Top 5 proccess by Memory: "
top -l 2 -n 5 -stats pid,command,mem -o mem | tail -6 | awk {print}

echo