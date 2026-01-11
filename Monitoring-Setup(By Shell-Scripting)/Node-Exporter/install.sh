#!/bin/bash
echo -e "\e[32m Full the changes if any \e[0m"
git pull

if [ $(id -u) -nq 0 ]; then
  echo "You should Run as root user"
  exit 1
  fi

echo -e "\e[32m Removing old Node-Exporter if any\e[0m"
if [ -d /opt/node_exporter ]; then
  systemctl stop node_exporter
  rm -rf /opt/node_exporter /etc/systemd/system/node_exporter
  fi

echo -e "\e[32m Copying Prometheus service file \e[0m"
cp ./node_exporter.service /etc/systemd/system/node_exporter.service

echo -e "\e[32m Changing Node_exporter Directory \e[0m"
cd /opt

echo -e "\e[32m Downloading Node Exporter package \e[0m"
curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.10.2/node_exporter-1.10.2.linux-amd64.tar.gz

echo -e "\e[32m Extracting Node_exporter file \e[0m"
tar -xf node_exporter-1.10.2.linux-amd64.tar.gz

echo -e "\e[Cleaning Up\e[0m"
rm -rf node_exporter-1.10.2.linux-amd64.tar.gz

echo -e "\e[Renaming the Node_exporter file\e[0m"
mv node_exporter-1.10.2.linux-amd64 node_exporter

echo -e "\e[Starting Node_exporter Service\e[0m"
systemctl daemon-reload
systemctl start node_exporter
systemctl enable node_exporter

if [ $? -eq 0 ]; then
  echo -e "\e[32m Service is Started\e[0m"
  else
    echo -e "\e[31m Failed to start the Service"
    fi





