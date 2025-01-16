# Server Performance Stats
A script to analyse basic server performance stats. 

> [!IMPORTANT]
> This script only works well on MacOS because `top` is different on Linux.

## Getting Started
1. **Clone the repository**
    ```
    git clone https://github.com/dottox/roadmap.sh-devops
    cd Beginner\ Projects/ && Server\ Perfomance\ Stats
    ```

2. **Make the script executable**
    ```
    chmod +x server-stats.sh
    ```
3. **Execute the script**  
    ```
    ./server-stats.sh
    ```

## Example of Output
```
ignaciosuarez@192 Server Performance Stats % ./server-stats.sh 

######################
# Server Perf. Stats #
######################

Thu Jan 16 11:29:35 -03 2025

- Total CPU usage:  24.99%
- Total Memory usage:  15G used
- Total Disk usage:  70.61% (161Gi of 228Gi)

Top 5 proccess by CPU: 
PID    COMMAND          %CPU
890    com.crowdstrike. 28.7
17926  sysmond          14.3
75323  firefox          11.4
595    coreaudiod       8.0 
12347  top              6.8 

Top 5 proccess by Memory: 
PID    COMMAND          MEM   
75323  firefox          1423M+
64243  plugin-container 1389M+
44311  lsiagentd        951M  
574    WindowServer     927M  
1673   Microsoft Teams  793M
```

This project is part of [roadmap.sh](https://roadmap.sh/projects/server-stats) DevOps projects.