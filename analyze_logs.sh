#!/bin/bash
echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
echo -n "Enter choice (1-3): "
read choice

# counting logs per device 
if [ $choice = 1 ];
then
   file_count=$(ls -1 "hospital_data/heart_data_archive" | wc -l)
   message="There are $file_count logs in heart_data_archive"
elif [ $choice = 2 ]; 
then
   file_count=$(ls -1 "hospital_data/temp_data_archive" | wc -l)
   message="There are $file_count logs in tem_data_archive"
elif [ $choice = 3 ]; 
then
   file_count=$(ls -1 "hospital_data/water_data_archive" | wc -l)
   message="There are $file_count logs in water_data_archive"
else 
   message="Invalid choice"
fi

echo $message






