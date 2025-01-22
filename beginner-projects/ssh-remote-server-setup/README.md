# SSH Remote Server Setup
A basic remote linux server and configure it to allow SSH. 

## Getting Started
1. **Create a Remote Server**
Create your a Linux server using you preferred Cloud Provider.

- Create a new Linux server (e.g., Ubuntu 20.04 LTS).
- Note down the server's IP address.

2. **Generate SSH key pairs**
On your local machine, create the SSH key pair to access securely to the server.
    ```
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com" 
    ```

- Name the key files to anything you want.
- This will create 2 files: xyz (private key) and xyz.pub (public key)

3. **Add the SSH key to the server**
Use the following command to copy the public key to your server:
- Replace user with your server's username (e.g., root).
- Replace server-ip with your server's IP address.
    ```
    ssh-copy-id -i ~/.ssh/id_rsa.pub user@server-ip
    ```
   
If ssh-copy-id doesn't work, you can manually copy the public key by logging in to the server using a password and editing the ~/.ssh/authorized_keys file:
    ```
    ssh user@server-ip
    mkdir -p ~/.ssh
    echo "your-public-key" >> ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
    chmod 700 ~/.ssh
    ```

4. **Configure SSH Access on Your Local Machine**
To simplify connecting to your server, edit the SSH configuration file on your local machine:
    ```
    nano ~/.ssh/config
    ```

Add the following lines to the config file:
    ```
    Host myserver
    HostName server-ip
    User user
    IdentityFile ~/.ssh/xyz
    ```

- Replace "myserver" with an alias you want to use for this server.
- Replace "server-ip" with your server’s IP address.
- Replace "user" with your server's username.
  
5. **Test SSH Connection**
Test the SSH connection using the alias you set up:
    ```
    ssh myserver
    ```

6. **Optional: Install Fail2ban for Security**
Install Fail2ban:
    ```
    sudo apt update
    sudo apt install fail2ban
    ```

Configure Fail2ban to protect SSH by editing the configuration file:
    ```
    sudo nano /etc/fail2ban/jail.local
    ```

Add the following:
    ```
    [sshd]
    enabled = true
    port = ssh
    logpath = /var/log/auth.log
    maxretry = 3
    bantime = 1200
    findtime = 600
    ```

Restart the Fail2ban service:
    ```
    sudo systemctl restart fail2ban
    ```