# RAID (Redundant Array of Independent Disks)

A technology that combines multiple physical hard drives into a single unit to achieve:
- Data redundancy
- Improved performance

The drives work together as a system, offering benefits that a single drive cannot provide.

## RAID levels

**1. RAID 0 (Striping)**  
- Purpose: Improves performance.
- How it works: Data is split into blocks and distributed (striped) across all drives in the array. This increases read and write speeds because multiple disks can be accessed simultaneously.
Drawback: No redundancy. If one drive fails, all data is lost.

**2. RAID 1 (Mirroring)**  
- Purpose: Provides redundancy.
- How it works: Data is duplicated (mirrored) on two or more drives. If one drive fails, the data is still available on the other drive(s).
Drawback: Only half of the total drive capacity is usable because each piece of data is stored twice.

**3. RAID 5 (Striping with Parity)**  
- Purpose: Balances performance and redundancy.
- How it works: Data is striped across multiple drives, but a parity block (a type of error-checking code) is also written to each drive. If one drive fails, the data can be reconstructed using the parity information.
Drawback: Requires at least three drives. The array can tolerate one drive failure, but performance may be degraded during a rebuild.  

**4. RAID 6 (Striping with Double Parity)**
- Purpose: Provides extra redundancy.
- How it works: Similar to RAID 5, but with two parity blocks written to each drive. This allows the array to withstand the failure of two drives simultaneously.
Drawback: Requires at least four drives. More overhead compared to RAID 5.   

**5. RAID 10 (or 1+0)**
- Purpose: Combines performance and redundancy.
- How it works: Combines RAID 1 (mirroring) and RAID 0 (striping). Data is first mirrored across pairs of drives, and then striped across multiple mirrored pairs. This provides both redundancy and improved performance.
- Drawback: Requires at least four drives, and only half of the total capacity is usable.

## Pros and Cons
- Benefits of RAID:
  - Improved Performance: RAID can increase read/write speeds by distributing data across multiple drives.
  - Redundancy: RAID can protect against data loss due to hardware failure by storing data redundantly across multiple drives.
  - Larger Storage: RAID can combine the storage capacity of multiple drives into a single logical unit.
- Drawbacks of RAID:
  - Complexity: Managing and configuring RAID arrays can be more complex than using single drives.
  - Cost: RAID configurations require multiple drives, which can be more expensive than a single drive solution.
  - Data Loss Risk: Depending on the RAID level, there might still be a risk of data loss, especially in configurations like RAID 0. RAID is also not a substitute for backups.
