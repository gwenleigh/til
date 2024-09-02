# IPMI (Intelligent Platform Management Interface)

ipmitool is a command-line utility for managing and configuring devices that support the Intelligent Platform Management Interface (IPMI). IPMI is a set of standardized specifications for hardware-based platform management systems that allow remote management and monitoring of servers, even if the server is turned off or unresponsive.

IPMI is a standardized interface used for managing and monitoring servers and other hardware systems. IPMI is typically implemented as firmware running on a dedicated management controller within the server hardware. 

## IPMI device examples
| Device Type               | Description                                                                                     |
|---------------------------|-------------------------------------------------------------------------------------------------|
| Server Motherboards       | Many server motherboards include an IPMI management controller for remote management.<br>  |
| Blade Servers             | Blade server chassis often include integrated IPMI controllers for managing all blades.  <img src="https://www.supermicro.com/a_images/products/views/7228R-T2X_node.jpg" alt="Supermicro SBI-7228R-T2X blade server, containing two dual-CPU server nodes, from Wikipedia" width="300">        |
| Rackmount Servers         | Standalone rackmount servers come with built-in IPMI support, allowing for remote management.    |
| Server Appliances         | Dedicated server appliances may include IPMI functionality for remote management.               |
| Workstation Motherboards  | Some high-end workstation motherboards incorporate IPMI for remote management capabilities.     |
| Embedded Systems          | Certain embedded systems, like industrial servers, may utilize IPMI for remote management.       |
| Data Center Infrastructure| IPMI can be found in PDUs, environmental monitors, and switches, providing centralized management.|



## Commands

| Command                 | Description                                    |
|-------------------------|------------------------------------------------|
| `ipmitool sdr`          | (Sensor Data Repository) lists the server's hardware components with status (watts, voltage, percent & active status) |
| `ipmitool sdr list`     | Lists the status of all sensors.               |
| `ipmitool sdr elist`     | Lists the status of all sensors with (error) status.               |
| `ipmitool sel elist`     | Lists logs of error events from the System Event Log (SEL), logged by BMC |
| `ipmitool bmc reset cold`     | a cold reset of the Baseboard Management Controller (BMC)               |


## Readings `ipmitool sel elist` 

**PSU**

```
PSU1 | ok | 10.1 | 250 watts
PSU2 | ok | 30.1 | 0 watts 
```

- Power supplies are typically monitored for voltage output (in volts) and power consumption or delivery (in watts).