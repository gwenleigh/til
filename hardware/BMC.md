# BMC (Baseboard Management Controller)

- A specialized microcontroller embedded in server motherboards that is used for out-of-band management of the hardware. 
- BMCs are a critical part of modern server infrastructure, allowing system administrators to monitor and manage servers remotely, even if the system is powered off or the operating system is unresponsive.

<img src="https://upload.wikimedia.org/wikipedia/commons/d/db/ASPEED_AST2400_BMC_Baseboard_management_controller.jpg" width=500 >

## Key functions
- Remote Management: BMC provides remote access to the server hardware for tasks like rebooting, configuring the BIOS, or installing an OS. This is often done through interfaces like IPMI (Intelligent Platform Management Interface) or Redfish.

- Health Monitoring of server hardware
    - <mark style="background-color: #FF999C">temperature, fan speed, power supply status, and system voltages.</mark>
    - <mark style="background-color: #FF999C">If any component exceeds safe operating thresholds, the BMC can trigger alerts.</mark>

- Power Control: BMC can turn the server on, off, or cycle its power. This is useful for remote troubleshooting and ensuring that the system can be brought back online after a failure.

- Event Logging: BMC logs events related to hardware issues, such as failures or warnings. These logs can be analyzed to understand the cause of hardware failures or performance degradation.

- BIOS/UEFI Management: BMC allows remote access to the BIOS/UEFI settings, enabling configuration changes or firmware updates without needing physical access to the machine.

- KVM over IP: Many BMC implementations include KVM (Keyboard, Video, Mouse) over IP functionality, allowing administrators to interact with the server as if they were physically present, including at the BIOS or OS level.

BMC in Server Management:
- IPMI: IPMI is a common interface used with BMCs. It is a standardized interface that allows monitoring, logging, and remote management of server hardware.
- Redfish: Redfish is a more modern API that provides similar functionality but with a more RESTful approach, often used in cloud data centers.
