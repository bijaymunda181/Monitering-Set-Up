## Elk
ELK Stack is a centralized log management and analysis tool used to collect, store, search, and visualize logs from multiple servers in one place.</br>

ELK stands for:
- E – Elasticsearch
- L – Logstash
- K – Kibana
It is commonly used by Linux administrators, DevOps engineers, and Cloud Support Engineers to monitor and troubleshoot servers and applications.</br>
## 1. Three components of ELK Stack

1. **Elasticsearch**</br>
Stores, indexes, and searches log data.</br>
Example: Search all SSH login failures across 100 Linux servers.</br>


2. **Logstash**</br>
Collects, processes, and transforms log data before sending it to Elasticsearch.</br>
Example: Read /var/log/secure, filter failed login messages, and forward them.</br>

3. **Kibana**</br>
Provides a web-based dashboard to visualize and analyze logs.</br>
Example: View SSH failures, HTTP errors, and application errors through graphs and dashboards.</br>



**2. How ELK works**</br>
   Suppose your company has 100 Linux servers running on AWS EC2.</br>


**Real-time example:**</br>

A user tries to SSH into a Linux server but gets permission denied.
1. The Linux server generates an authentication failure log.
2. Logstash collects the log.
3. Elasticsearch stores and indexes it.
4. You open Kibana and search for SSH authentication failures.
5. You identify which server is having login issues.