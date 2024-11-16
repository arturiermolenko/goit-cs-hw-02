#!/bin/bash

websites=("https://google.com" "https://facebook.com" "https://x.com")
log_file="status.log"

> $log_file


for page in "${websites[@]}"; do
	status_code=($(curl -o /dev/null -s -L -w "%{http_code}\\n" $page))
	
	if [ $status_code -eq 200 ]; then
		echo "$page is UP"
		echo "$page is UP" >> $log_file
	else
		echo "$page is DOWN"
		echo "$page is DOWN" >> $log_file
	fi
done

echo "Results are written to logfile: $log_file"

