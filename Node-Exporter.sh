#Setup Node Exporter

#1. Download Node Exporter

#Check latest release from Node Exporter releases
#. Example:

cd /opt
sudo curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.8.2/node_exporter-1.8.2.linux-amd64.tar.gz

#2. Extract and Move
sudo tar -xvzf node_exporter-1.8.2.linux-amd64.tar.gz
sudo mv node_exporter-1.8.2.linux-amd64 node_exporter
sudo mv node_exporter/node_exporter /usr/local/bin/

#3. Create Node Exporter User
sudo useradd --no-create-home --shell /bin/false nodeusr

#4. Create Systemd Service
sudo cp node_exporter.service  /etc/systemd/system/node_exporter.service



#5. Start Node Exporter
sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter
sudo systemctl status node_exporter


#By default, Node Exporter runs on port 9100.
#Check in browser:

#http://<your_server_ip>:9100/metrics

#6. Configure Prometheus to Scrape Node Exporter

#Edit Prometheus config:

#sudo vim /etc/prometheus/prometheus.yml


# Add under scrape_configs:



#7. Restart Prometheus
#sudo systemctl restart prometheus


#Now Prometheus collects system metrics from Node Exporter 🎉
