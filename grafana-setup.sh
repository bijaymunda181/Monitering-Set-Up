#Install Grafana in your local-machine
yum install grafana -your

#Start and enable service
systemctl enable grafana-server
systemctl start grafana-server

# Try to Access through browser
http://SERVER_IP:3000

- user_name: admin
- password: admin

✅ Step 4: Connect Prometheus to Grafana

Login to Grafana

⚙️ → Data Sources → Add data source

Select Prometheus

URL:

http://localhost:9090



