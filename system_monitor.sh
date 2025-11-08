#!/bin/bash

# Simple System Monitor

echo "----------------------------------------"
echo "        LINUX SYSTEM MONITOR"
echo "----------------------------------------"
echo "Date & Time: $(date)"
echo

echo "---- System Uptime ----"
uptime
echo

echo "---- Memory Usage ----"
# 'free' might not be on macOS; use vm_stat fallback
if command -v free >/dev/null 2>&1; then
  free -h
else
  echo "(free not found; using vm_stat on macOS)"
  vm_stat
fi
echo

echo "---- Disk Usage ----"
df -h
echo

echo "---- Top 5 CPU Consuming Processes ----"
ps -eo pid,comm,%mem,%cpu --sort=-%cpu | head -n 6
echo

echo "---- Logged In Users ----"
who
echo

echo "---- System Health Report Complete ----"

