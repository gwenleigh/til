# SPAN (Switched Port Analyser)
1. It is a feature used in network switches to monitor network traffic. 
2. SPAN ports (aka mirror ports) are used to send a copy of network packets seen on one switch port (or an entire VLAN) to another port where the packet can be analyzed.
3. SPAN is used for troubleshooting network issues, performing security analysis, and capturing data for network monitoring tools.

![Network switch, Avaya ERS 2550T-PWR, a 50-port Ethernet switch](https://upload.wikimedia.org/wikipedia/commons/b/b9/2550T-PWR-Front.jpg)

## Key features
1. Traffic Mirroring 
- SPAN duplicates the traffic from one or more source ports or VLANs and sends it to a designated destination port. 
- The destination port can connect to a monitoring device such as a network analyzer or intrusion detection system.

2. Types of SPAN
- **Local SPAN**: port-to-port, within same switch
  - Mirrors traffic from source ports to a destination port on the same switch.
- **Remote SPAN (RSPAN)**: from switch to switch, within same network
  - Extends SPAN functionality by allowing traffic to be mirrored to a port on a different switch within the same network, using a special VLAN to carry the mirrored traffic.
- **Encapsulated Remote SPAN (ERSPAN)**: across networks
  - Extends the functionality further by encapsulating the mirrored traffic in GRE (Generic Routing Encapsulation) packets, allowing it to be sent across Layer 3 networks.

![SPAN, from networklessons.com](https://cdn.networklessons.com/wp-content/uploads/2014/05/cisco-span-example.png) SPAN, port to port    
![RSPAN, from networklessons.com](https://cdn.networklessons.com/wp-content/uploads/2014/05/cisco-rspan-sw1-sw2.png) RSPAN, within the same network  

3. How SPAN Works
- **Configuration**: Network administrators configure SPAN sessions on a switch, specifying the source (port or VLAN) and the destination port.
- **Traffic Duplication**: The switch hardware then duplicates the traffic from the source and sends it to the destination port without affecting the original traffic flow.
- **Analysis**: The monitoring device connected to the destination port captures and analyzes the mirrored traffic.

4. Limitations
- **Bandwidth**: The destination port may become a bottleneck if the mirrored traffic exceeds its capacity.
- **Resource Intensive**: Mirroring large volumes of traffic can be resource-intensive for the switch, potentially impacting performance.
- **Single Point of Failure**: If the switch or the SPAN configuration fails, monitoring capabilities are lost.

## Examples
Following are examples of configuration on a Cisco switch. 

### Local SPAN (within switch)
```
Switch# configure terminal
Switch(config)# monitor session 1 source interface fastethernet 0/1
Switch(config)# monitor session 1 destination interface fastethernet 0/2
Switch(config)# end
```

### RSPAN (between switches)

#### Step 1. Create VLAN on each switch.
```
Switch1# configure terminal
Switch1(config)# vlan 900
Switch1(config-vlan)# remote-span
Switch1(config-vlan)# end

Switch2# configure terminal
Switch2(config)# vlan 900
Switch2(config-vlan)# remote-span
Switch2(config-vlan)# end
```

#### Step 2. Configure the SPAN source on the source switch  
Define which traffic to mirror and where to send it on the source switch.

```
Switch1# configure terminal
Switch1(config)# monitor session 1 source interface fastethernet 0/1  (mirrored)
Switch1(config)# monitor session 1 destination remote vlan 900        (traffic sent to)
Switch1(config)# end
```

#### Step 3. Configure the SPAN destination on the destination switch
Set up the destination port to receive the mirrored traffic on the destination switch.
```
Switch2# configure terminal
Switch2(config)# monitor session 1 source remote vlan 900
Switch2(config)# monitor session 1 destination interface fastethernet 0/2
Switch2(config)# end
```

### ERSPAN (across networks)
ERSPAN encapsulates the mirrored traffic in GRE packets, and sends the packets traversing Layer 3 networks.

#### Step 1: Configure ERSPAN on the source switch
Define the source of the traffic and configure the ERSPAN destination, including the destination IP address.
```
Switch1# configure terminal
Switch1(config)# monitor session 1 type erspan-source
Switch1(config-mon-erspan-src)# source interface fastethernet 0/1
Switch1(config-mon-erspan-src)# destination
Switch1(config-mon-erspan-src-dst)# erspan-id 10
Switch1(config-mon-erspan-src-dst)# ip address 192.168.1.2
Switch1(config-mon-erspan-src-dst)# origin ip address 192.168.1.1
Switch1(config-mon-erspan-src-dst)# end
```

#### Step 2: Configure ERSPAN on the destination switch
Define the ERSPAN session to decapsulate the traffic and direct it to a destination port.
```
Switch2# configure terminal
Switch2(config)# monitor session 1 type erspan-destination
Switch2(config-mon-erspan-dst)# destination interface fastethernet 0/2
Switch2(config-mon-erspan-dst)# source
Switch2(config-mon-erspan-dst-src)# erspan-id 10
Switch2(config-mon-erspan-dst-src)# ip address 192.168.1.2
Switch2(config-mon-erspan-dst-src)# end
```