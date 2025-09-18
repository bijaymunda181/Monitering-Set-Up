#Download Prometheus

#1. Find the latest version from Prometheus downloads
#. Example:

cd /opt
sudo curl -LO https://github.com/prometheus/prometheus/releases/download/v2.55.0/prometheus-2.55.0.linux-amd64.tar.gz

#2. Extract Files
sudo tar -xvzf prometheus-2.55.0.linux-amd64.tar.gz
sudo mv prometheus-2.55.0.linux-amd64 prometheus

#3. Create Prometheus User
sudo useradd --no-create-home --shell /bin/false prometheus

#4. Move Binaries
cd /opt/prometheus
sudo mv prometheus /usr/local/bin/
sudo mv promtool /usr/local/bin/

#5. Create Config & Data Directories
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
sudo cp -r consoles /etc/prometheus
sudo cp -r console_libraries /etc/prometheus
sudo cp prometheus.yml /etc/prometheus/
sudo chown -R prometheus:prometheus /etc/prometheus /var/lib/prometheus


#6. Copy Prometheus Systemd Service
sudo cp prometheus.service /etc/systemd/system/prometheus.service

#7. Start Prometheus
sudo systemctl daemon-reload
sudo systemctl enable prometheus
sudo systemctl start prometheus
sudo systemctl status prometheus

#8. Access Prometheus UI

#Open in browser:

#http://<your_server_ip>:9090

sudo rm -f /etc/prometheus/prometheus.yml
sudo cp prometheus.yml /etc/prometheus/prometheus.yml
sudo systemctl restart prometheus
