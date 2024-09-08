# VLAN and subnets

VLANs are primarily software-based. Subnets are more hardware-based. VLANs create logical networks that are independent of the physical network topology. Subnets create logical segments of a physical network that reflect the physical network topology.

<img src="https://www.pynetlabs.com/wp-content/uploads/2023/09/VLAN-Example.jpeg" width=1000>

| **Aspect**             | **VLAN (Virtual Local Area Network)**                        | **Subnet (Subnetworks)**                                |
|------------------------|-------------------------------------------------------------|--------------------------------------------------------|
| **Purpose**            | Segments a single physical network into multiple logical networks | Divides logical segments of a network based on IP address ranges and reduce broadcast traffic.   |
| **Layer of Operation**  | Layer 2 (Data Link Layer)                                   | Layer 3 (Network Layer)                                |
| **Use Case**           | Isolating traffic within the same physical infrastructure (e.g., separating departments, guest vs. employee traffic) | Efficient IP address allocation, network organization, and limiting broadcast traffic |
| **Key Benefit**        | Reduces broadcast domains, improves security, and isolates traffic on the same physical network | Reduces broadcast domains, organizes networks, and optimizes IP address space |
| **Relation to Each Other** | VLANs can correspond to subnets, but are not the same thing. A VLAN can have its own subnet or share one. | Subnets can exist within VLANs or span across multiple VLANs. |


## VLAN (Virtual Local Area Network):
- **Purpose**: VLANs are used to segment a single physical network into multiple, logical networks. They allow for the separation of traffic on a switch (or set of switches) into different groups, which can improve security and reduce congestion.
- **Layer**: VLANs operate at Layer 2 (Data Link Layer) of the OSI model.
- **Use Case**: VLANs are often used in situations where you want to isolate certain types of traffic (e.g., separating employee traffic from guest traffic, or isolating different departments in a company) while still using the same physical infrastructure (such as switches).
- **Benefits**: VLANs reduce broadcast domains and can provide security by segregating traffic between different groups within the same physical infrastructure.

## Subnet (Subnetworks):
- **Purpose**: A subnet is a logical division of an IP network into smaller, manageable pieces. It defines a range of IP addresses within a network that can communicate directly with each other without needing to route traffic through an external router.
- **Layer**: Subnets operate at Layer 3 (Network Layer) of the OSI model.
- **Use Case**: Subnetting is often used to create smaller networks within a larger network for more efficient IP address allocation and to limit the scope of broadcast traffic. It also helps in organizing networks by geography, function, or security level.
- **Benefits**: Subnets reduce the size of broadcast domains, help manage network traffic, and provide better use of IP address space.
Key Differences:
- **Layer of Operation**: VLANs work at Layer 2, while subnets work at Layer 3.
- **Purpose**: VLANs are primarily for segmenting network traffic within the same physical infrastructure, whereas subnets divide an IP network into smaller, more efficient units.
- **Interrelation**: VLANs often correspond to subnets, but they are not the same thing. For instance, each VLAN can be associated with its own subnet, but you could also have multiple VLANs within a single subnet or multiple subnets within a single VLAN.