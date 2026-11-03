## Average CPU Utilization Query
```
avg by (instance,name,job,instance_state,instance_type) ( 100 - (rate(node_cpu_seconds_total{mode="idle"}[1m]) * 100 ))
```