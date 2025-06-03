#!/bin/bash

# global variables
chosen_dir=""

# function for getting the directory from user choice i.e: 1,2,3
get_dir_from_choice() {
   case $1 in                      
      1)
         chosen_dir="hospital_data/heart_data_archive" ;;
      2)
         chosen_dir="hospital_data/temp_data_archive" ;;
      3)
        chosen_dir="hospital_data/water_data_archive" ;;
      *)
      chosen_dir="invalid directory"
   esac
}

# showing logs to the user
echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
echo -n "Enter choice (1-3): "
read choice

# updating chosen_dir variable
get_dir_from_choice $choice

echo $chosen_dir
if [ $chosen_dir != "invalid directory" ]; then       
   file_count=$(ls -1 $chosen_dir | wc -l)
   echo "There are $file_count in directory $chosen_dir"
fi








