#!/bin/bash

# Get the directory to archive. First argument
directory=$1

# Check if the directory exists
if [[ ! -d $directory || -z $directory ]]; then
    echo "Usage: $0 <directory>"
    exit 1
fi


# Create a new directory to store the log files
if [ ! -d logs ]; then
    mkdir logs
fi


# Archive the log files
for file in $(ls $directory); do
    if [ -f $directory/$file ]; then

        # Get the date of the file
        date=$(date -r $directory/$file +"%Y%m%d_%H%M%S")

        # Create a new name for the file
        name=$(echo "${file%.*}_$date.tar.gz")

        # Compress the file and move it to the logs directory
        tar -czvf $name $directory/$file
        mv $name logs
    fi
done
