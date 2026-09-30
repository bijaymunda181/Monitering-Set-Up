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