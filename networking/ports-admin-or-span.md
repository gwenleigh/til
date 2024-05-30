# Ports: Admin port or SPAN port?

## Admin Port
This refers to the management or administrative interface on a network switch. The admin port is used for **configuration and management** purposes. It often has the following characteristics:
- Out-of-Band Management: Typically, the admin port is used for out-of-band management, which means it is separate from the data traffic that the switch handles. This allows network administrators to configure and manage the switch without interfering with the regular network traffic.
- Access: The admin port can be accessed via a web interface, command-line interface (CLI), or through protocols such as SSH or Telnet.
- Configuration: It is used to configure various settings of the switch, such as VLANs, IP routing, security policies, and firmware updates.

## SPAN Port
Also known as a mirror port, the SPAN port is used for **network monitoring and analysis**. 
- Port Mirroring: SPAN port mirrors the traffic of one or more ports or VLANs on the switch. A copy of the traffic is sent to the SPAN port, which can then be connected to a network monitoring device, such as an intrusion detection system (IDS) or a packet analyzer.
- Analysis: Network administrators use the SPAN port to monitor and analyze network traffic for troubleshooting, performance analysis, and security monitoring.
- Configuration: Setting up a SPAN port typically involves specifying which ports or VLANs should be mirrored. This can be done through the switch's management interface.

![SPAN ports, Proper Sky](https://www.garlandtechnology.com/hs-fs/hubfs/Current/Diagrams/Diagrams%202020/TAP-v-SPAN-Diagram-SPAN.png?width=599&height=220&name=TAP-v-SPAN-Diagram-SPAN.png)

![Ports, ports, ports! from Cisco Community](https://community.cisco.com/legacyfs/online/media/ws-c2960s-24ts-s1-2.jpg)

## Comparison

|  | Admin Port | SPAN Port |
|----------|----------|----------|
| Purpose | Configures and manages the switch | Monitors and analyses network traffic |
| Traffic Handling | Handles only management traffic | Receives copies of data traffic from other ports or VLANs. |
| Use Cases | Updates switch settings, manages VLANs, applys security policies. | Captures and analyses network packets, monitors network performance, detects anomalies. |


### References
- Proper Sky https://propersky.com/span-port-vs-network-tap/