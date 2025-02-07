# Static Site Server
A basic linux server and configure it to serve a static site using Nginx. 

## Getting Started
1. **Create a Remote Server**
Create your a Linux server using you preferred Cloud Provider.

- Create a new Linux server (e.g., Ubuntu 20.04 LTS).
- Note down the server's IP address.

2. **Install Nginx**
Connect via SSH to your remote server and install Nginx
    ```
    sudo apt update
    sudo apt install nginx
    ```

> Check if Nginx is running using `curl localhost`

3. **Create the web files in your local host**
Create a HTML and CSS file in your local machine. I've used this files:
    ```
    mkdir web-files
    touch index.html styles.css
    ```

    ```
    index.html
    
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Static Site Server</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <div class="container">
            <h1 class="title">Static Site Server</h1>
            <p class="description">A basic linux server and configure it to serve a static site using Nginx. </p>
        </div>
    </body>
    </html>
    ```

    ```
    styles.css

    /* Base Styles */
    body {
      margin: 0;
      font-family: 'Arial', sans-serif;
      background-color: #f4f4f9;
      color: #333;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    /* Container */
    .container {
      text-align: center;
      max-width: 600px;
      padding: 20px;
      background: white;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    /* Title */
    .title {
      font-size: 2.5rem;
      margin-bottom: 1rem;
      color: #2c3e50;
    }

    /* Description */
    .description {
      font-size: 1.125rem;
      line-height: 1.6;
      color: #555;
    }
    ```

4. **Synchronize files using rsync**
Using rsync, synchronize local files to the remote server.
    ```
    # usage: rsync origin/dir user@ip:target/dir
    rsync -av -e "ssh -i path/to/private/key.prv" web-files/ root@ip-remote-server:/var/www/html
    ```

> -a is used to recursively syncs and preserves symbolic links, special and device files, modification times, groups, owners, and permissions.
> -v verbose mode.
> -e let you specify the SSH method, helpful when you need a private key to connect.

Possible output using -v mode

    Transfer starting: 3 files
    ./index.html
    ./styles.css
    sent 1266 bytes  received 70 bytes  205 bytes/sec
    total size is 1017  speedup is 0.76
  
> Check new files with `curl http://remote-server-ip`

This project is part of [roadmap.sh](https://roadmap.sh/projects/static-site-server) DevOps projects.
