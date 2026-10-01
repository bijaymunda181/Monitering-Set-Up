## 1. What is prometheus ?
Prometheus is a white box monitoring tool. </br>
White box means insights are visible.

## 2. What is Node Exporter ?
Node exporter is a prometheus that collects system level metrics from linux servers, such as CPU, memory, disk, filesystem, network metrics, and expose them for prometheus to scraps.

## 3. Why do we use Node Exporter ?
We use Node Exporter to collect linux server metrics and make them available to Prometheus for monitoring.

## 4. Which port does Node Exporter use?
9100

## 5. How do you check Node Exporter metrics?
We can access the ```/metrics``` endpoint:
```
curl http://localhost:9100/metrics
```
## 6. Where do you create the Node Exporter service file?
```
/etc/systemd/system/node_exporter.service
```

## 7. What is ```ExecStart```?
```ExecStart``` specifies the command that systemd should execute when starting the service.</br>
**Example:**
```
ExecStart=/usr/local/bin/node_exporter
```
It means systemd will execute:
```
/usr/local/bin/node_exporter
```

## 8. Why do we create a separate ```node_exporter``` user?
We create a dedicated user to run Node Exporter instead of running it as root. This follows the principle of least privilege and improves security.

## 9. How does Prometheus collect Node Exporter metrics?
Prometheus uses a pull-based model. It periodically sends an HTTP request to the Node Exporter's /metrics endpoint and collects the metrics.</br>
For example:
```
Prometheus
    |
    | GET http://server:9100/metrics
    ↓
Node Exporter
```

## 10. Where do you configure the Node Exporter target?
Usually in:</br>
```
/etc/prometheus/prometheus.yml
```
Example:
```
scrape_configs:
  - job_name: "node_exporter"
    static_configs:
      - targets: ["10.0.1.10:9100"]
```

## 11. What is a scrape target?
A scrape target is an endpoint from which Prometheus collects metrics.</br>
For Node Exporter:
```
10.0.1.10:9100
```
is the target.

## 12. What happens if Node Exporter is down?
Prometheus will not be able to scrape new metrics from that server. The target will become DOWN, and no new Node Exporter metrics will be collected until the exporter becomes available again.

## 13. Prometheus shows Node Exporter as DOWN. How would you troubleshoot?
I would troubleshoot step by step:
```
1. Check Node Exporter service
        ↓
2. Check port 9100
        ↓
3. Test /metrics locally
        ↓
4. Test connectivity from Prometheus server
        ↓
5. Check firewall / Security Group
        ↓
6. Check Prometheus configuration
```
Commands:
```
systemctl status node_exporter
```
```
ss -lntp | grep 9100
```
```
curl http://localhost:9100/metrics
```
From the Prometheus server:
```
curl http://<server-ip>:9100/metrics
```

## 14. Node Exporter service is failing. What would you check?
First: I would check service status
```
systemctl status node_exporter
```
Then I'll check the node_exporter logs:
```
journalctl -u node_exporter
```
I would also check:
```
ls -l /usr/local/bin/node_exporter
```
And verify the ```ExecStart``` path in service file.

## 15. ```curl localhost:9100/metrics``` works, but Prometheus cannot access it. What could be the problem?
If it works locally but not from the Prometheus server, I would check network connectivity and security controls.</br>
I would check :
- Security Group
- Linux firewall
- Network ACL
- Routing
- Port 9100
- Node Exporter's listening address

## 16. Explain the complete monitoring flow.(Important)
Node Exporter runs on the Linux server and collects system-level metrics such as CPU, memory, disk, and network metrics. It exposes these metrics on port 9100. Prometheus periodically scrapes the Node Exporter ```/metrics``` endpoint and stores the metrics. Grafana then connects to Prometheus and visualizes the metrics through dashboards.
