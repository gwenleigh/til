# netcat
- Networking utility used for **reading from** and **writing to network connections** using TCP or UDP protocols.
- By default, Netcat operates over TCP connections. 

## Applications
1) Port scanning: Checking for open ports on a remote system.
2) File transfer: Sending or receiving files over a network connection.
3) Remote administration: Executing commands on remote systems.
4) Network debugging: Inspecting network traffic and troubleshooting network-related issues.
5) Port forwarding: Redirecting network traffic from one port to another.
6) Chat server/client: Setting up a simple chat server or client for communication between systems.

### Examples
- It is typically needed to specify a port number when establishing a connection, as Netcat operates by creating connections to specific ports on remote systems.

#### over TCP 
```
nc <hostname or IP address> <port number>
nc 192.168.1.100 80
```

#### over UDP
The `-u` flag instructs netcat to use UDP. 
```
nc -u <hostname or IP address> <port number>
```

## Commands
| Use Case               | Example Command                                                                                             | Notes |
|------------------------|-------------------------------------------------------------------------------------------------------------|-------|
| Port scanning          | `nc -zv 192.168.1.100 1-100`                                                                                | Scan for open ports from 1 through 100 on the specified IP address | 
| File transfer          | **Sending end (client):** `nc 172.31.25.67 443 < file_to_send` <br>**Receiving end (server):** `nc -l -p 443 > received_file` | Send a file from one system to another |
| Remote administration  | **Sending end (client):** `nc 172.31.25.67 443` <br>**Receiving end (server):** `nc -l -p 443 -e /bin/bash` | Execute commands on a remote system |
| Network debugging     | `nc -l -p PORT`<br>`nc -l -p 443`                                                                            | Inspect network traffic |
| Port forwarding       | `nc -l -p SOURCE_PORT \| nc DEST_IP DEST_PORT`<br>`nc -l -p 443 \| nc 172.31.25.67 443`                      | Forward network traffic from one port to another |
| Chat server/client    | **Server side:** `nc -l -p 443`<br> **Client side:** `nc <server IP address> <port number>`                  | Set up a simple chat server and client |

## Layer comparison

| OSI Layer      | Netcat         | Curl          | Ping          |
|----------------|----------------|---------------|---------------|
| Application    | ✔ Yes (depending on usage) | ✔ Yes            | No           |
| Presentation   | No             | No            | No            |
| Session        | No             | No            | No            |
| Transport      | ✔ Yes (TCP/UDP)  | No            | No            |
| Network        | ✔ Yes            | ✔ Yes           | ✔ Yes           |
| Data Link      | No             | No            | No            |
| Physical       | No             | No            | No            |
