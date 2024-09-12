# `netstat`

Used for analysing network connections (active connections, routing tables, network stats). 

- To troubleshoot network issues: check which ports are open and listening, and whether connections are being established properly.
- To monitor active connections: see which IP addresses are connected to your system and which ports they are using.
- To detect potential unauthorized activity: It can help you spot unusual connections or services listening on unexpected ports.

# Commands

- `netstat -an`
    - `-a`
        - all. display all active connections (both incoming and outgoing), including those that are listening for incoming connections.
        = shows both established connections and listening ports (i.e., ports that are waiting for incoming connections).
    - `-n`
        - numeric. forces netstat to display addresses and port numbers in their numeric form rather than resolving and displaying hostnames or service names.
        - it will show an IP address like 192.168.1.1 instead of trying to resolve it to a domain name, and port 80 instead of displaying "http."