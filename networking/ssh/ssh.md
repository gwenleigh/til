# SSH (Secure Shell)

SSH (Secure Shell) is a cryptographic network protocol that allows users to securely access and manage remote servers over an unsecured network. It provides a secure way to log into a server, execute commands, transfer files, and manage systems remotely, all while ensuring that the communication is encrypted.

- **Remote Access**: SSH allows you to connect to a remote server and access its command line. For example, you could use SSH to log into a Linux server from your Mac and run commands as if you were physically there.
- **File Transfer**: Tools like SCP (Secure Copy) or SFTP (Secure File Transfer Protocol) are often used with SSH to transfer files securely between your local machine and the remote server.
- **Port Forwarding**: SSH can also be used to securely forward network traffic from one machine to another. This is useful for tunneling into a network or securely accessing a remote service.
- **Remote Execution**: You can execute commands and scripts on a remote machine without logging in interactively.

```
ssh user_name@192.168.1.231
```