# Nginx Log Analyser
A simple tool to analyze Nginx logs from the command line. 

## Getting Started
1. **Clone the repository**
    ```
    git clone https://github.com/dottox/roadmap.sh-devops
    cd Beginner\ Projects/ && Nginx\ Log\ Analyser
    ```

2. **Make the script executable**
    ```
    chmod +x nginx-log-analyser.sh
    ```
    
3. **Execute the script**  
    ```
    ./nginx-log-analyser.sh <logs-file>
    ```

## Example of output
```
ignaciosuarez@192 nginx-log-analyser % ./nginx-log-analyser.sh nginx-access.log 

######################
# Nginx Log Analyser #
######################

Top 5 IP addresses with most requests:
178.128.94.113 - 1087 requests
142.93.136.176 - 1087 requests
138.68.248.85 - 1087 requests
159.89.185.30 - 1086 requests
86.134.118.70 - 277 requests

Top 5 most requested paths:
/v1-health - 4560 requests
/ - 270 requests
/v1-me - 232 requests
/v1-list-workspaces - 127 requests
/v1-list-timezone-teams - 75 requests

Top 5 response status codes:
200 - 5740 requests
404 - 937 requests
304 - 621 requests
400 - 192 requests
"-" - 31 requests

```

This project is part of [roadmap.sh](https://roadmap.sh/projects/nginx-log-analyser) DevOps projects.