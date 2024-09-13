# RAM (Random Access Memory)

```
ID  | Date        | Time     | Sensor Name   | Event Type      | Description
----|-------------|----------|---------------|-----------------|---------------------------------------
001 | 09/01/2023  | 15:42:17 | Memory ECC    | Correctable ECC | Correctable ECC @ DIMM A1
002 | 09/02/2023  | 07:32:54 | Memory        | Uncorrectable ECC | Uncorrectable ECC @ DIMM B2
003 | 09/03/2023  | 10:25:36 | Memory        | Critical         | Memory Over Temperature @ DIMM C3
004 | 09/04/2023  | 11:17:05 | Memory Parity | Critical         | Memory Parity Error @ DIMM D4
```

### Components
- ID: Unique identifier for the event in the SEL.
- Date/Time: The timestamp when the event occurred.
- Sensor Name: The name of the sensor that triggered the event, in this case, related to memory (e.g., Memory ECC, Memory Parity).
- Event Type: The type of event (e.g., Correctable ECC, Uncorrectable ECC, Critical).
- Description: A more detailed description of the event, including which memory module (DIMM) is affected.

### Common RAM-Related Events:
- Correctable ECC: Indicates a correctable memory error detected by ECC.
- Uncorrectable ECC: Indicates a memory error that cannot be corrected by ECC, which could cause system instability.
- Memory Over Temperature: Indicates that a memory module has exceeded the acceptable temperature range.
- Memory Parity Error: Indicates a parity error detected in the memory.

### ECC 
ECC (Error-Correcting Code) is a type of computer memory (RAM) that can detect and correct data corruption. It is primarily used in systems where data integrity is critical, such as servers, workstations, and high-performance computing systems.

