# **Automated Log Management System**

## **Features**

- Collects real-time patient health metrics and resource usage data
- Provides controlled log archiving with user selection
- Generates analytical reports with device statistics and temporal patterns

## **Usage**

To use this project, follow these steps:

1. Clone the repository: **`git clone https://github.com/terancebana/Coding-lab_Group5`**
2. Navigate to the working directory: **`cd hospital_data`**
3. To start a monitoring device: **`python3 [respective python script] start`** e.g: **`python3 heart_monitor.py start`**
4. To archive a log file: **`bash archive_logs.sh`**
5. To generate an analysis report: **`bash analyze_logs.sh`**
6. To read the report file: **`cat reports/analysis_report.txt`**
7. Stop the monitoring device: **`python3 [respective python script] stop`** e.g: **`python3 heart_monitor.py stop`**

## **Notes**

- Remember to start the monitoring device, before using it.
- Choose valid choices:
  - 1 for Heart monitoring device
  - 2 for Temperature monitoring device
  - 3 for Water-usage monitoring device
- Remember to close the monitoring device, after using it.

## **About the team**

The Automated log management system, was a classroom activity. We did this as group5. The contributors were:

- **Elijah Kabatsi**
- **David Katate**
- **Dianah Shimwa**
- **Terance Cyuzuzo**
- **Samuel Kabera**
- **Given Edward**

You can checkout our github usernames in the contributors area

Members of the group who did not contribute to the project:

- **Bradley GASANA**