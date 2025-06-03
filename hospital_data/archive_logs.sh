#!/bin/bash

LOG_DIR="hospital_data/active_logs"
ARCHIVE_HEART="hospital_data/heart_data_archive"
ARCHIVE_TEMP="hospital_data/temp_data_archive"
ARCHIVE_WATER="hospital_data/water_data_archive"

echo "Select log to archive:"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"
read -p "Enter choice (1-3): " choice

TIMESTAMP=$(date '+%Y-%m-%d_%H:%M:%S')

case "$choice" in
	  1)
		      FILE="heart_rate.log"
		          DEST="$ARCHIVE_HEART"
			      ;;
			        2)
					    FILE="temperature.log"
					        DEST="$ARCHIVE_TEMP"
						    ;;
						      3)
							          FILE="water_usage.log"
								      DEST="$ARCHIVE_WATER"
								          ;;
									    *)
										        echo "Invalid input. Exiting."
											    exit 1
											        ;;
										esac

										SOURCE="$LOG_DIR/$FILE"
										ARCHIVED_FILE="${FILE%.log}_$TIMESTAMP.log"

										if [ ! -f "$SOURCE" ]; then
											  echo "Error: Log file $SOURCE does not exist."
											    exit 1
										fi

										mkdir -p "$DEST"

										mv "$SOURCE" "$DEST/$ARCHIVED_FILE"
										if [ $? -ne 0 ]; then
											  echo "Error: Failed to move log file."
											    exit 1
										fi

										touch "$SOURCE"
										if [ $? -eq 0 ]; then
											  echo "Successfully archived $FILE to $DEST/$ARCHIVED_FILE"
											    echo "Created new empty log file $SOURCE"
										    else
											      echo "Error: Could not create new log file."
											        exit 1
										fi
