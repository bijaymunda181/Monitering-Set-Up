scrape_configs:
# The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.
- job_name: "prometheus"
  # metrics_path defaults to '/metrics'
  # scheme defaults to 'http'.
  static_configs:
    - targets: ["localhost:9090"]
      labels:
      name: "Master_Node"


# Node2 Details
- job_name: "node2"
  static_configs:
    - targets: ["172.16.0.3:9100"]
      labels:
      name: "Node-2"

# Node1 Details
- job_name: "node1"
  static_configs:
    - targets: ["172.16.0.2:9100"]
      labels:
      name: "Node-1"      

# Note:- 
# There is feature called service discover that can automatically find targets(server) that prometheus needs to monitor.
# Prerequisites are for the Prometheus server are should have attached IAM Role with AmazonEC2ReadOnlyAccess or ec2:DescribeInstances permission . And node-exporter should install also.
# For the target server only node-exporter should be installed.

scrape_configs:
- job_name: 'ec2'
  ec2_sd_configs:
    - region: us-east-1
      port: 9100
  filters:
    - name: "tag:Monitor"
      value: [ "yes" ]

  relabel_configs:
  - source_labels: [__meta_ec2_tag_Name]
    target_label: instance  
  - source_labels: [__meta_ec2_tag_env]
    target_label: env  
  - source_labels: [__meta_ec2_instance_type]
    target_label: instance_type
  - source_labels: [__meta_ec2_instance_state]
    target_label: instance_state  





