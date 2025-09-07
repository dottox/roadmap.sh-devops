package main

import (
	"fmt"
	"os"
	"time"
)

// const FILE_PATH = "/var/log/dummy-service.log"
const LOG_FILE_PATH string = "/var/log/dummy-service.log"
const SLEEP_TIME time.Duration = 10 * time.Second

func main() {

	// Opens the file, creating it if it doesn't exist
	f, err := os.OpenFile(LOG_FILE_PATH, os.O_CREATE|os.O_RDWR, 0644)
	if err != nil {
		fmt.Printf("err: %v\n", err)
		return
	}

	// It will be a systemd service, so we should be running forever in background
	for {

		// Write a message in the log file
		_, err := f.WriteString("Dummy service is running...\n")
		if err != nil {
			fmt.Printf("err: %v\n", err)
			return
		}

		// Sleeps for 10 second
		time.Sleep(SLEEP_TIME)
	}
}
