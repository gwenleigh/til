# DHCP
Dynamic Host Configuration Protocol is a network management protocol used to automate the process of configuring devices on IP networks. It allows devices to receive necessary configuration information, such as <mark style="background-color: hsla(48, 100%, 91%, 0.5)">IP addresses, subnet masks, gateways, and DNS server addresses</mark>, dynamically without manual intervention.

<img src="https://crnetpackets.com/wp-content/uploads/2017/04/dhcp-basics-initial2.png?w=2000&h=" width=800>  

<img src="https://crnetpackets.com/wp-content/uploads/2017/04/dhcp-basics-renew4.png?w=780&h=289" width=800>  

Images from [crnetpackets.com](https://crnetpackets.com/2017/04/24/ipv4-basics-part-1-dhcp-dynamic-host-configuration-protocol/)

## DHCP packet
A DHCP packet is a formatted unit of <mark style="background-color: hsla(48, 100%, 91%, 0.5)">data carried by the protocol during the DHCP communication process</mark>. Essentially, it is the data that is exchanged between the client (the device requesting configuration) and the server (the device providing configuration).
- DHCP Client - Server data exchange
    - During DHCP communication

##  Differences Between DHCP and DHCP Packet
- **DHCP (the Protocol)**: Refers to the <mark style="background-color: hsla(48, 100%, 91%, 0.5)">overall system and set of rules</mark> used to dynamically assign IP addresses and other network configuration parameters to devices on a network including the processes, server, client, and relay agents.
- **DHCP Packet**: Refers specifically to the data unit used in the DHCP protocol communication. It is the means by which the information is exchanged between the DHCP server and client.

| Field                        | Description                                                                          |
|------------------------------|--------------------------------------------------------------------------------------|
| Operation Code (op)          | Indicates the message type. For example, 1 for a request (from client to server) and 2 for a reply (from server to client). |
| Hardware Type (htype)        | Specifies the type of hardware address being used (e.g., Ethernet).                  |
| Hardware Address Length (hlen) | Specifies the length of the hardware address.                                       |
| Hops (hops)                  | The number of networks the packet hops through until it reaches DHCP server. Client is 0.<br>Used by relay agents to control message forwarding.                                  |
| Transaction ID (xid)         | A random number chosen by the client, used to match requests and replies.            |
| Seconds (secs)               | The elapsed time since the client began the address acquisition process.             |
| Flags (flags)                | Various control flags.                                                               |
| Client IP Address (ciaddr)   | The client’s IP address (only if the client already has one).                        |
| Your (client) IP Address (yiaddr) | The IP address assigned to the client.                                           |
| Next Server IP Address (siaddr) | IP address of the next server to use in the bootstrap process.                     |
| Relay Agent IP Address (giaddr) | Used by relay agents to forward DHCP messages.                                    |
| Client Hardware Address (chaddr) | The hardware address of the client.                                              |
| Server Hostname (sname)      | Optional server hostname.                                                            |
| Boot File Name (file)        | The boot file name, used in some environments.                                       |
| Options (options)            | Various options and parameters (e.g., subnet mask, router, DNS server).              |


### DHCP Request (DHCPDISCOVER)

| Field                    | Description                           |
|--------------------------|---------------------------------------|
| op                       | 1 (request)                           |
| htype                    | 1 (Ethernet)                          |
| hlen                     | 6 (length of MAC address)             |
| hops                     | 0                                     |
| xid                      | 0x3903F326 (Transaction ID)           |
| secs                     | 0                                     |
| flags                    | 0x0000                                |
| ciaddr                   | 0.0.0.0 (client's IP address)         |
| yiaddr                   | 0.0.0.0 (your IP address)             |
| siaddr                   | 0.0.0.0 (next server IP address)      |
| giaddr                   | 0.0.0.0 (relay agent IP address)      |
| chaddr                   | 00:25:96:FF:FE:12:34:56 (client's MAC)|
| sname                    | (empty)                               |
| file                     | (empty)                               |
| options                  |                                       |
| - DHCP Message Type      | DHCPDISCOVER (1)                      |
| - DHCP Client Identifier | 00:25:96:FF:FE:12:34:56               |
| - Parameter Request List | Subnet Mask, Router, DNS Server       |
| - End                    |                                       |

### DHCP Reply (DHCPOFFER)
| Field                    | Description                           |
|--------------------------|---------------------------------------|
| op                       | 2 (reply)                             |
| htype                    | 1 (Ethernet)                          |
| hlen                     | 6 (length of MAC address)             |
| hops                     | 0                                     |
| xid                      | 0x3903F326 (Transaction ID)           |
| secs                     | 0                                     |
| flags                    | 0x0000                                |
| ciaddr                   | 0.0.0.0 (client's IP address)         |
| yiaddr                   | 192.168.1.10 (your IP address)        |
| siaddr                   | 192.168.1.1 (next server IP address)  |
| giaddr                   | 0.0.0.0 (relay agent IP address)      |
| chaddr                   | 00:25:96:FF:FE:12:34:56 (client's MAC)|
| sname                    | (empty)                               |
| file                     | (empty)                               |
| options                  |                                       |
| - DHCP Message Type      | DHCPOFFER (2)                         |
| - Server Identifier      | 192.168.1.1                           |
| - IP Address Lease Time  | 86400 seconds (1 day)                 |
| - Subnet Mask            | 255.255.255.0                         |
| - Router                 | 192.168.1.1                           |
| - DNS Server             | 8.8.8.8, 8.8.4.4                      |
| - End                    |                                       |

### Resources 
Further reading
- Nathan's tech blog https://blog.naver.com/PostView.naver?blogId=tkdldjs35&logNo=222017789280