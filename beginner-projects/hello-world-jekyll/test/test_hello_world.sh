#!/bin/bash

# Start Jekyll server
bundle exec jekyll serve --detach

# Wait for the server to start
sleep 5

# Fetch the generated site
response=$(curl -s http://localhost:4000)

# Check if the response contains "Hello World"
if echo "$response" | grep -q "Hello World"; then
  echo "Test passed: 'Hello World' found in the response."
  exit 0
else
  echo "Test failed: 'Hello World' not found in the response."
  exit 1
fi
