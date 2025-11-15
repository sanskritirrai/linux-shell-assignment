#!/bin/bash
#Monitor Code

LOG="$HOME/system_monitor.log"
INT=5

echo "Monitoring started at $(date)" >> "$LOG"
while true
do
  CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')
  MEM=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2}')
  echo "$(date) | CPU: $CPU | MEM: $MEM" >> "$LOG"
  sleep "$INT"
done
