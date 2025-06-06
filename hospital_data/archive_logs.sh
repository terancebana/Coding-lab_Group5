#!/bin/bash

BASE_DIR="$(pwd)" 

ACTIVE_LOGS_DIR="$BASE_DIR/active_logs"
ARCHIVED_LOGS_BASE_DIR="$BASE_DIR/archived_logs"

handle_error() {
    echo "Error: $1" >&2
    exit 1
}

echo "Select log to archive:"
echo "1) Heart Rate (heart_rate_log.log)"
echo "2) Temperature (temperature_log.log)"
echo "3) Water Usage (water_usage_log.log)"
read -p "Enter choice (1-3): " choice

case $choice in
    1)
        LOG_NAME="heart_rate_log"
        ARCHIVE_SUBDIR="heart_data_archive"
        ;;
    2)
        LOG_NAME="temperature_log"
        ARCHIVE_SUBDIR="temperature_data_archive"
        ;;
    3)
        LOG_NAME="water_usage_log"
        ARCHIVE_SUBDIR="water_usage_data_archive"
        ;;
    *)
        handle_error "Invalid user input. Please choose 1, 2, or 3." [cite: 5]
        ;;
esac

[ -d "$ACTIVE_LOGS_DIR" ] || handle_error "Active logs directory not found: $ACTIVE_LOGS_DIR"
[ -d "$ARCHIVED_LOGS_BASE_DIR" ] || handle_error "Archived logs base directory not found: $ARCHIVED_LOGS_BASE_DIR"


ACTIVE_LOG_FILE="$ACTIVE_LOGS_DIR/${LOG_NAME}.log"
ARCHIVE_TARGET_DIR="$ARCHIVED_LOGS_BASE_DIR/$ARCHIVE_SUBDIR"


if [ ! -f "$ACTIVE_LOG_FILE" ]; then
    handle_error "Missing log file: $ACTIVE_LOG_FILE. Please make sure that the monitor is running." [cite: 5]
fi

if [ ! -d "$ARCHIVE_TARGET_DIR" ]; then
    echo "Creating archive directory: $ARCHIVE_TARGET_DIR"
    mkdir -p "$ARCHIVE_TARGET_DIR" || handle_error "Failed to create archive directory: $ARCHIVE_TARGET_DIR" [cite: 5]
fi

echo "Archiving ${LOG_NAME}.log..."


TIMESTAMP=$(date +"%Y-%m-%d_%H:%M:%S")
NEW_ARCHIVED_FILENAME="${LOG_NAME}_${TIMESTAMP}.log"
DESTINATION_PATH="$ARCHIVE_TARGET_DIR/$NEW_ARCHIVED_FILENAME"


TIMESTAMP=$(date +"%Y-%m-%d_%H:%M:%S")
NEW_ARCHIVED_FILENAME="${LOG_NAME}_${TIMESTAMP}.log"
DESTINATION_PATH="$ARCHIVE_TARGET_DIR/$NEW_ARCHIVED_FILENAME"

mv "$ACTIVE_LOG_FILE" "$DESTINATION_PATH" || handle_error "Failed to move log file." [cite: 2, 4]

touch "$ACTIVE_LOG_FILE" || handle_error "Failed to create new empty log file." [cite: 4]

echo "Successfully archived to $DESTINATION_PATH" [cite: 4]