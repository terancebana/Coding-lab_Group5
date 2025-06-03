#!/bin/bash


mkdir -p reports


echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
echo -n "Enter choice (1-3): "
read choice


case $choice in
    1) log_file="active_logs/heart_rate.log"
       device_type="Heart Rate Monitor"
       ;;
    2) log_file="active_logs/temperature.log"
       device_type="Temperature Sensor"
       ;;
    3) log_file="active_logs/water_usage.log"
       device_type="Water Meter"
       ;;
    *) echo "Invalid choice. Please select 1-3."
       exit 1
       ;;
esac


if [ ! -f "$log_file" ]; then
    echo "Error: Log file $log_file not found!"
    exit 1
fi
