# SPAN session
- Simply put, the configuration for traffic mirroring.   
- A configuration setup on a network switch that specifies the parameters for mirroring network traffic from one or more source ports or VLANs to a designated destination port. 
- The term "session" indicates <mark style="background-color: hsla(48, 100%, 91%, 0.5)">**a specific instance of this configuration**</mark>, allowing network administrators to manage and organize multiple traffic mirroring tasks independently.

In the context of networking, particularly with SPAN (Switched Port Analyzer), the term <mark style="background-color: hsla(48, 100%, 91%, 0.5)">"session" does not imply a set time duration</mark> as it might in other contexts, such as user sessions in applications or websites. Instead, a SPAN session refers to a specific configuration setup on a network switch to mirror traffic, and <mark style="background-color: hsla(48, 100%, 91%, 0.5)">this configuration remains active until it is manually modified or removed by a network administrator</mark>.

## Lifespan of SPAN
A SPAN (Switched Port Analyzer) session is configured on a network switch, it starts mirroring the specified traffic continuously, 24/7, until the configuration is changed or removed by the network administrator.

- **Immediate Activation**: As soon as the SPAN session is configured, the switch begins to mirror the traffic from the specified source ports or VLANs to the destination port.
- **Continuous Monitoring**: The mirroring process runs continuously, capturing all the traffic that matches the source criteria in real-time.
    - **24/7 Traffic Capture**: As long as the configuration remains, the traffic from the source will be mirrored continuously to the destination. This is useful for ongoing monitoring and real-time analysis.
- **No Built-in Expiration**: There is no built-in expiration for a SPAN session. It remains active as part of the switch's configuration until explicitly modified or deleted by an administrator.
- **Performance Impact**: While SPAN sessions are highly useful, it's important to consider the performance impact. <mark style="background-color: hsla(48, 100%, 91%, 0.5)">Continuous mirroring can consume resources on the switch, and if the mirrored traffic volume is high</mark>, it may impact the performance of the destination port or the switch itself.
- **Monitoring Devices**: The destination port is typically connected to a monitoring device such as a network analyzer, Intrusion Detection System (IDS), or other security and performance monitoring tools. These devices can analyze the mirrored traffic in real-time or store it for later analysis.

## Key points

- **Persistent Monitoring**: SPAN sessions are useful for continuous monitoring of critical network segments, as they can remain in place indefinitely.
- **Dynamic Adjustments**: Network administrators can adjust or redefine SPAN sessions at any time without affecting the underlying network traffic, allowing for dynamic monitoring setups.
- **Long-Term Analysis**: Because SPAN sessions do not expire, they are suitable for long-term traffic analysis and troubleshooting.

## Key Components of a SPAN Session
- 1) **Source**: the ports, VLANs, or other traffic sources that you want to monitor. These are the points from which network traffic is copied.
  - Example: One or more specific switch ports, a range of ports, or an entire VLAN.
- 2) **Destination**: the port where the mirrored traffic is sent. This port typically connects to a network analyzer, intrusion detection system (IDS), or other monitoring devices.
  - Example: A single port on the switch dedicated to receiving the copied traffic.
- 3) **Session Identifier**: a unique identifier (often a number) for each SPAN session. This allows the switch to distinguish between different monitoring configurations.
  - Example: Session 1, Session 2, etc.

## Purpose of SPAN Sessions
- **Traffic Analysis**: to capture and analyse traffic for performance monitoring, troubleshooting, and security purposes.
- **Intrusion Detection**: to send traffic to a security device that monitors for potential threats and attacks.
- **Network Performance**: to monitor and diagnose network performance issues by analyzing traffic patterns and identifying bottlenecks.
- **Compliance**: to ensure adherence to regulatory requirements by capturing and storing network traffic for audit purposes.

## Example SPAN Session Configuration on a Cisco Switch

```
Switch# configure terminal
Switch(config)# monitor session 1 source interface fastethernet 0/1
Switch(config)# monitor session 1 destination interface fastethernet 0/2
Switch(config)# end
```

- **Session 1** : The unique identifier for the SPAN session.
- **Source** : Traffic from `fastethernet 0/1` is mirrored.
- **Destination** : The mirrored traffic is sent to `fastethernet 0/2`.

## Types of SPAN Sessions
1. Local SPAN: Mirrors traffic within the same switch.
  - Example: Monitoring traffic on port 1 and sending it to port 2 on the same switch.

2. Remote SPAN (RSPAN): Mirrors traffic to a different switch using a special RSPAN VLAN.
  - Example: Monitoring traffic on port 1 of Switch A and sending it to port 3 of Switch B using VLAN 900.

3. Encapsulated Remote SPAN (ERSPAN): Mirrors traffic over Layer 3 networks by encapsulating it in GRE (Generic Routing Encapsulation) packets.
  - Example: Monitoring traffic on port 1 of Switch A and sending it to an IP address on Switch C across a Layer 3 network.

## Practical Use Case of a SPAN Session
Consider a network where you need to monitor traffic from several important servers connected to a switch:

Identify Source Ports: Determine which ports the servers are connected to.
Configure SPAN Session: Set up a SPAN session to mirror traffic from these source ports to a destination port connected to a network analyzer.

```
Switch# configure terminal
Switch(config)# monitor session 1 source interface fastethernet 0/10 - 0/12
Switch(config)# monitor session 1 destination interface fastethernet 0/15
Switch(config)# end
```

- Source: Ports 0/10, 0/11, and 0/12 (servers).
- Destination: Port 0/15 (network analyzer).

### Remove SPAN session
```
Switch# configure terminal
Switch(config)# no monitor session 1
Switch(config)# end
```