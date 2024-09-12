# Connection vs. Bandwidth

I'm monitoring my server's dashboard. There is a consistent level of connections but no bandwidth (0 byte). What do you think is happening? 

## Causes 

1) Idle Connections: The connections might be established but not actively transmitting or receiving data. These could be clients that open connections but remain idle without sending or receiving requests.

2) Health Checks: Some automated systems or load balancers periodically check the server's health by making connections. These health checks typically don't involve large data transfers, which could explain why you're seeing connections but no bandwidth usage.

3) DDoS or Bot Activity: If there are a large number of connections but no data transfer, it could be a sign of a Distributed Denial of Service (DDoS) attack or bot traffic. Attackers or bots might be making connection attempts without sending meaningful requests.

4) Network or Application Issues: There could be a misconfiguration in your application or network settings that allows connections but prevents actual data transfer, such as firewall settings or misconfigured load balancers.

## Troubleshooting

Logs (processing requests) and packet analysis (traffic source)

- Check your server's firewall or load balancer logs.
- Inspect the logs of your application to see if requests are being processed.
- Analyze the source of the connections to rule out malicious traffic.

## Bandwidth: data transfer

- The amount of data traveling across the network, and it's typically measured by monitoring the data throughput on your network interface, such as the Ethernet (eth) port.
- Often measured in bits per second (bps), kilobits (Kbps), or megabits (Mbps).
- Monitoring tools: `ifconfig`, `netstat`, `nload`, `iftop`, 

## Connection: 

How are connections measured differently than network traffic, because at the end of the day, connections are bits of data transferred to the receiving eth port anyway. How can it be technically different from bandwidth? 
- Connections are data themselves, as establishing and maintaining a connection involves exchanging packets between client and server. 
- However, connections and bandwidth are measured differently because they represent different aspects of network activity

### Key Differences Between Measuring Connections and Bandwidth

Connections and bandwidth are both packets. They are just different types of packets.

**1. Connection Packets (Control Packets)**

- Purpose: These packets are used to establish, maintain, and close connections between two devices. They control the communication process but don’t typically carry much user data.
- Types:
    - TCP Handshake Packets: For example, in a TCP connection, the communication starts with a 3-way handshake:
    - SYN (Synchronize): Sent to initiate a connection.
    - SYN-ACK (Synchronize Acknowledgement): Response to SYN, confirming receipt and readiness.
    - ACK (Acknowledgement): Sent to confirm the connection.
    - FIN/ACK or RST: Packets sent to gracefully close or reset a connection.
- Size: These packets are small and only carry control information (e.g., source/destination IP, port numbers, flags for controlling the connection).
- Examples:
    - TCP packets for connection establishment (SYN, SYN-ACK).
    - Keep-alive packets that maintain a connection but don’t transfer user data.

**2. Data Packets (Payload Packets)**

- Purpose: These packets are used to carry actual user data over an established connection. This data could be anything like a web page, a video, a file, or any other content.
- Types:
    - TCP/UDP Data Packets: Once a connection is established, the network starts transferring data via packets that include not only the control information (headers) but also a payload, which contains the actual content being sent.
    - Application Data: For example, in an HTTP request, the payload will contain the contents of the web page, images, scripts, etc.
- Size: These packets are generally larger because they carry the actual data (payload) along with the control information.
- Examples:
    - HTTP packets transferring a web page or a file.
    - Streaming packets carrying video or audio data.