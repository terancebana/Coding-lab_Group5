#!/bin/bash

BASE_DIR="$(pwd)" 

ACTIVE_LOGS_DIR="$BASE_DIR/active_logs"
ARCHIVED_LOGS_BASE_DIR="$BASE_DIR/archived_logs"

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


