#!/bin/bash

BASE_DIR="$(pwd)"

ACTIVE_LOGS_DIR="$BASE_DIR/active_logs"
REPORTS_DIR="$BASE_DIR/reports"
ANALYSIS_REPORT_FILE="$REPORTS_DIR/analysis_report.txt"

handle_error() {
    echo "Error: $1" >&2
    exit 1
}

[ -d "$ACTIVE_LOGS_DIR" ] || handle_error "Active logs directory not found: $ACTIVE_LOGS_DIR"
[ -d "$REPORTS_DIR" ] || mkdir -p "$REPORTS_DIR" || handle_error "Failed to create reports directory: $REPORTS_DIR"

echo "Select log file to analyze:" 
echo "1) Heart Rate (heart_rate_log.log)" 
echo "2) Temperature (temperature_log.log)" 
echo "3) Water Usage (water_usage_log.log)" 
read -p "Enter choice (1-3): " choice 

case $choice in
    1)
        LOG_FILE_NAME="heart_rate_log.log"
        LOG_DISPLAY_NAME="Heart Rate"
        ;;
    2)
        LOG_FILE_NAME="temperature_log.log"
        LOG_DISPLAY_NAME="Temperature"
        ;;
    3)
        LOG_FILE_NAME="water_usage_log.log"
        LOG_DISPLAY_NAME="Water Usage"
        ;;
    *)
        handle_error "Invalid user input. Please choose 1, 2, or 3." 
        ;;
esac

LOG_PATH="$ACTIVE_LOGS_DIR/$LOG_FILE_NAME"

if [ ! -f "$LOG_PATH" ]; then
    handle_error "Log file not found: $LOG_PATH. Please ensure the monitor is running or it hasn't been archived without creating a new empty file."
fi

echo -e "\n--- Analysis Report for $LOG_DISPLAY_NAME Log ---" >> "$ANALYSIS_REPORT_FILE"
echo "Date and Time of Analysis: $(date +"%Y-%m-%d %H:%M:%S")" >> "$ANALYSIS_REPORT_FILE"
echo "Analyzing: $LOG_PATH" >> "$ANALYSIS_REPORT_FILE"
echo "---------------------------------------------------" >> "$ANALYSIS_REPORT_FILE"

echo "Device Occurrences:" >> "$ANALYSIS_REPORT_FILE"
awk '{print $3}' "$LOG_PATH" | sort | uniq -c | while read -r count device; do
    echo "  $device: $count readings" >> "$ANALYSIS_REPORT_FILE"
done

# redirect results to the report file