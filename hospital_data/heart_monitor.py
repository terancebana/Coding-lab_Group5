import random
import time
import sys
import os
from datetime import datetime

# Directory and file configuration
LOG_DIR = "active_logs"
LOG_FILE = os.path.join(LOG_DIR, "heart_rate_log.log")
PID_FILE = "/tmp/heart_rate_monitor.pid"
DEVICES = ["HeartRate_Monitor_A", "HeartRate_Monitor_B"]

def ensure_log_dir():
    if not os.path.exists(LOG_DIR):
        os.makedirs(LOG_DIR)

def log_data():
    ensure_log_dir()
    while True:
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        for device in DEVICES:
            heart_rate = random.randint(60, 100)
            with open(LOG_FILE, "a") as f:
                f.write(f"{timestamp} {device} {heart_rate}\n")
        time.sleep(1)

def start():
    pid = os.fork()
    if pid > 0:
        with open(PID_FILE, "w") as f:
            f.write(str(pid))
        print(f"Started. PID: {pid}")
    else:
        log_data()

def stop():
    if os.path.exists(PID_FILE):
        with open(PID_FILE, "r") as f:
            pid = int(f.read().strip())
        os.kill(pid, 9)
        os.remove(PID_FILE)
        print("Stopped.")
    else:
        print("No running process found.")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python3 heart_rate_monitor.py [start|stop]")
        sys.exit(1)
    
    if sys.argv[1] == "start":
        start()
    elif sys.argv[1] == "stop":
        stop()
    else:
        print("Invalid command. Use 'start' or 'stop'.")
