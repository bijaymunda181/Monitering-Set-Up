#!/bin/bash
git pull
if [ $(id -u ) -ne 0 ]; then
  echo "You Should Run as a root user"
  exit 1
fi

echo -e "\e[\e[32m Removing old Prometheus installation if any\e[0m"
if [ -d /opt/promethous ]; then
  systemctl stop prometheus
  rm -rf /opt/prometheus /etc/systemd/system/prometheus.service
  fi

echo -e "\e[32m Copying Prometheus service file \e[0m"
  ./prometheus.service /ect/systemd/system/prometheus.service

echo -e "\e[32m Change Prometheus directories\e[0m"
  cd /opt

echo -e "\e[32m Download Prometheus package\e[0m"
curl -LO https://github.com/prometheus/prometheus/releases/download/v3.9.1/prometheus-3.9.1.linux-amd64.tar.gz

echo -e "\e[32m Extracting Prometheus service \e[0m"
  tar -xf prometheus-3.9.1.linux-amd64.tar.gz

echo -e "\e[32m Cleaning Up \e[0m"
  rm -rf prometheus-3.9.1.linux-amd64.tar.gz

echo -e "\e[32m Renaming Prometheus service \e[0m"
  mv prometheus-3.9.1.linux-amd64.tar.gz prometheus

echo -e "e/[32m Starting Prometheus service"
  systemctl start prometheus
  systemctl enable prometheus
  if [ $? -eq 0 ]; then
    echo -e "/e[32m service started \e[0m"
    else
      echo -e "/e[31Failed to start the service \e[0m"
  fi