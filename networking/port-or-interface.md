# Port or Interface? 
The terms "interface" and "port" are often used interchangeably, but they have slightly different connotations.
- Port: they are the physical ports most of the times. 
- Interface: can be either physical or logical (virtual), or both. 
    - May refer to a logical entity that represents a network connection.

![Physical ports, Cisco](https://community.cisco.com/legacyfs/online/media/ws-c2960s-24ts-s1-2.jpg)

### Examples
- Physical Port: When discussing hardware setup, "Connect the Ethernet cable to port 5 on the switch."
- Logical Interface: When configuring the network, "Assign IP address `192.168.1.1` to interface `GigabitEthernet0/1`."

### Virtual interfaces
Interfaces are configured in software and can include parameters such as IP addresses, subnet masks, and routing information.

- VLAN interfaces (for managing traffic in a VLAN)
- Loopback interfaces (used for testing and management)
- Tunnel interfaces (used for VPNs and other tunneling protocols)

![Virtual interface, Palo Alto](https://docs.paloaltonetworks.com/content/dam/techdocs/en_US/dita/_graphics/uv/prisma/prisma-sd-wan/prisma-sd-wan-admin/controller-port-redundancy-usecase2.png)