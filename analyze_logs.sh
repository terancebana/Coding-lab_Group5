#!/bin/bash

# function for updating the chosen directory 
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

if [ "$chosen_dir" != "invalid directory" ]; then   
   entries_count=$(ls -1 $chosen_dir | wc -l)
   first_entry=$(ls $chosen_dir | head -n 1)
   last_entry=$(ls $chosen_dir | tail -n 1)

   # splitting the filename into an array over character "." 
   IFS='.' read -a first_file_parts <<< "$first_entry"
   IFS='.' read -a last_file_parts <<< "$last_entry"
   first_entry_name=${first_file_parts[0]}
   last_entry_name=${first_file_parts[0]}
   
   # splitting the filename into an array over character "_"
   IFS='_' read -a first_entry_names <<< "$first_entry_name"
   IFS='_' read -a last_entry_names <<< "$last_entry_name"

   # actual timestamps for entries
   first_entry_timestamps="${first_entry_names[-2]} ${first_entry_names[-1]}"
   last_entry_timestamps="${last_entry_names[-2]} ${last_entry_names[-1]}"
   
   # printing the results
   echo "There are $entries_count entries in $chosen_dir"
   echo "first entry timestamp: $first_entry_timestamps"
   echo "last entry timestamp: $last_entry_timestamps"
else
   echo "Incorrect choice, the valid choices are: 1,2,3"   
fi








