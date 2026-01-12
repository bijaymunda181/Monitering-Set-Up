## CPU Metrics
1. CPU Usage Percentage (per instance)
   100 - (avg by (instance) (
   rate(node_cpu_seconds_total{mode="idle"}[5m])
   ) * 100)

2. CPU Usage (per core)
   100 - (avg by (instance, cpu) (
   rate(node_cpu_seconds_total{mode="idle"}[5m])
   ) * 100)

## Memory Metrics
1. Memory Used (in %)
   100 * (
   1 - (node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes)
   )

2. Memory Used (bytes)
   node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes

3. Free Memory
   node_memory_MemFree_bytes

## Disk Metrics
1.Disk Usage Percentage (per mount point)
100 * (
1 - (
node_filesystem_avail_bytes{fstype!~"tmpfs|overlay"} /
node_filesystem_size_bytes{fstype!~"tmpfs|overlay"}
)
)

2. Disk Used (bytes)
   node_filesystem_size_bytes - node_filesystem_avail_bytes

3. Disk Read / Write (IO)
   rate(node_disk_read_bytes_total[5m])
   rate(node_disk_written_bytes_total[5m])

4. Disk IOPS
   rate(node_disk_reads_completed_total[5m])
   rate(node_disk_writes_completed_total[5m])

## Swap Memory
Swap Used
node_memory_SwapTotal_bytes - node_memory_SwapFree_bytes

