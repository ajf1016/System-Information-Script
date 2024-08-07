#!/bin/bash

get_cpu_usage() {
  echo "CPU Usage:"
  top -bn1 | grep "Cpu(s)" | \
  sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
  awk '{print 100 - $1"%"}'
}

get_memory_usage() {
  echo "Memory Usage:"
  free -h | grep Mem | awk '{print $3"/"$2}'
}


get_disk_usage() {
  echo "Disk Usage:"
  df -h | grep '^/dev/' | awk '{print $1 ": " $5}'
}


get_network_status() {
  echo "Network Status:"
  ip -4 addr show | grep inet | awk '{print $2}' | sed 's/\/.*//'
}


get_system_uptime() {
  echo "System Uptime:"
  uptime -p
}


echo "System Information"
echo "=================="
get_cpu_usage
echo
get_memory_usage
echo
get_disk_usage
echo
get_network_status
echo
get_system_uptime
echo
