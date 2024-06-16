# DHCP
Dynamic Host Configuration Protocol is a network management protocol used to automate the process of configuring devices on IP networks. It allows devices to receive necessary configuration information, such as <mark style="background-color: hsla(48, 100%, 91%, 0.5)">IP addresses, subnet masks, gateways, and DNS server addresses</mark>, dynamically without manual intervention.

##  Differences Between DHCP and DHCP Packet
- **DHCP (the Protocol)**: Refers to the <mark style="background-color: hsla(48, 100%, 91%, 0.5)">overall system and set of rules</mark> used to dynamically assign IP addresses and other network configuration parameters to devices on a network including the processes, server, client, and relay agents.
- **DHCP Packet**: Refers specifically to the data unit used in the DHCP protocol communication. It is the means by which the information is exchanged between the DHCP server and client.

## OSI layers DHCP operates on

| OSI Layer         | Role in DHCP                                                           |
|-------------------|------------------------------------------------------------------------|
| Layer 7 - Application Layer | DHCP functions as an application layer protocol, facilitating the allocation of IP addresses and configuration of network settings. |
| Layer 4 - Transport Layer    | DHCP uses UDP (User Datagram Protocol) with ports 67 (server) and 68 (client) for communication. |
| Layer 3 - Network Layer      | DHCP involves IP addressing, dynamically assigning IP addresses to devices. |
| Layer 2 - Data Link Layer    | DHCP messages are encapsulated within Ethernet frames for local network transmission. |

<img src="https://crnetpackets.com/wp-content/uploads/2017/04/dhcp-basics-initial2.png?w=2000&h=" width=800>    

Image from [crnetpackets.com](https://crnetpackets.com/2017/04/24/ipv4-basics-part-1-dhcp-dynamic-host-configuration-protocol/)