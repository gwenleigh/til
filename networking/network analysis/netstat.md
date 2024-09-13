# `netstat`

Used for analysing network connections (active connections, routing tables, network stats). 

- To troubleshoot network issues: check which ports are open and listening, and whether connections are being established properly.
- To monitor active connections: see which IP addresses are connected to your system and which ports they are using.
- To detect potential unauthorized activity: It can help you spot unusual connections or services listening on unexpected ports.

Stands for network statistics.
- network connections, routing tables, interface statistics, masquerade connections, and multicast memberships

- `sudo apt install net-tools`: install
- `netstat`
    - `-l`: currently listening ports for incoming connections
    - `-s`: net statistics
    - `-r`: routing table
    - `-i`: interfaces
    - `-tulnp`: connections with process ID
        - `-t`: Show TCP connections.
        - `-u`: Show UDP connections.
        - `-l`: Show only listening sockets.
        - `-n`: Show numerical addresses instead of resolving hostnames (e.g., IP addresses and port numbers instead of domain names).
        - `-p`: Show the process ID and name of the program that owns each socket.

- `MTU`: Maximum Transmission Unit. Max packet size that can be transmitted over the network interface. If a packet exceeds this size, it will be broken down into smaller packets, which can impact network performance due to increased overhead and potential delays.


## Hands-on examples

- `netstat`

    ```
    ~$ netstat
    Active Internet connections (w/o servers)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State      
    tcp        0      0 ip-172-31-31-20.e:43656 ec2-34-201-250-36.:http TIME_WAIT  
    tcp        0      0 ip-172-31-31-20.e:34488 209.54.183.5:https      ESTABLISHED
    tcp6       0      0 ip-172-31-31-20.ec2:ssh ec2-18-206-107-28:39353 ESTABLISHED
    Active UNIX domain sockets (w/o servers)
    Proto RefCnt Flags       Type       State         I-Node   Path
    unix  3      [ ]         STREAM     CONNECTED     7196     /run/dbus/system_bus_socket
    unix  3      [ ]         STREAM     CONNECTED     6826     
    unix  3      [ ]         STREAM     CONNECTED     6184     /run/dbus/system_bus_socket
    unix  3      [ ]         DGRAM      CONNECTED     2464     
    unix  2      [ ]         DGRAM      CONNECTED     7058     
    unix  3      [ ]         STREAM     CONNECTED     7190     
    unix  2      [ ]         DGRAM                    12650    /run/user/1000/systemd/notify
    unix  3      [ ]         STREAM     CONNECTED     6094     
    unix  2      [ ]         DGRAM      CONNECTED     2459     
    unix  3      [ ]         STREAM     CONNECTED     6150     /run/systemd/journal/stdout
    unix  3      [ ]         STREAM     CONNECTED     7094     
    unix  2      [ ]         DGRAM      CONNECTED     6004     
    unix  2      [ ]         DGRAM      CONNECTED     5945     
    unix  3      [ ]         DGRAM      CONNECTED     2463     
    unix  3      [ ]         STREAM     CONNECTED     6883     
    unix  2      [ ]         DGRAM      CONNECTED     3689     
    unix  3      [ ]         STREAM     CONNECTED     6218     /run/systemd/journal/stdout
    unix  3      [ ]         STREAM     CONNECTED     2486     /run/systemd/journal/stdout
    unix  3      [ ]         STREAM     CONNECTED     6036     /run/systemd/journal/stdout
    unix  3      [ ]         STREAM     CONNECTED     6827     
    unix  3      [ ]         STREAM     CONNECTED     2414     
    unix  3      [ ]         STREAM     CONNECTED     7080     
    unix  3      [ ]         STREAM     CONNECTED     6013     
    unix  3      [ ]         DGRAM      CONNECTED     1700     /run/systemd/notify
    unix  3      [ ]         STREAM     CONNECTED     6216     
    unix  3      [ ]         STREAM     CONNECTED     5918     
    unix  2      [ ]         DGRAM      CONNECTED     2039     
    unix  3      [ ]         STREAM     CONNECTED     6012     
    unix  2      [ ]         DGRAM      CONNECTED     5808     
    unix  2      [ ]         DGRAM                    1724     /run/systemd/journal/syslog
    unix  3      [ ]         STREAM     CONNECTED     6214     
    unix  12     [ ]         DGRAM      CONNECTED     1728     /run/systemd/journal/dev-log
    unix  8      [ ]         DGRAM      CONNECTED     1730     /run/systemd/journal/socket
    unix  3      [ ]         STREAM     CONNECTED     6215     /run/systemd/journal/stdout
    unix  3      [ ]         STREAM     CONNECTED     3369     /run/systemd/journal/stdout
    unix  3      [ ]         STREAM     CONNECTED     6886     /run/systemd/journal/stdout
    unix  3      [ ]         STREAM     CONNECTED     2439     
    unix  3      [ ]         STREAM     CONNECTED     7093     
    unix  2      [ ]         DGRAM      CONNECTED     7070     
    unix  3      [ ]         STREAM     CONNECTED     6095     /run/systemd/journal/stdout
    unix  3      [ ]         STREAM     CONNECTED     5892     /run/systemd/journal/stdout
    unix  3      [ ]         STREAM     CONNECTED     5935     /run/systemd/journal/stdout
    unix  3      [ ]         STREAM     CONNECTED     3368     
    unix  3      [ ]         STREAM     CONNECTED     6148     
    unix  3      [ ]         STREAM     CONNECTED     5890     
    unix  3      [ ]         STREAM     CONNECTED     6035     
    unix  3      [ ]         STREAM     CONNECTED     2477     /run/systemd/journal/stdout
    unix  3      [ ]         STREAM     CONNECTED     6708     
    unix  3      [ ]         STREAM     CONNECTED     13582    
    unix  3      [ ]         DGRAM      CONNECTED     5557     
    unix  3      [ ]         STREAM     CONNECTED     13602    /run/dbus/system_bus_socket
    unix  3      [ ]         STREAM     CONNECTED     6985     
    unix  3      [ ]         STREAM     CONNECTED     6699     /run/dbus/system_bus_socket
    unix  3      [ ]         STREAM     CONNECTED     8035     
    unix  3      [ ]         STREAM     CONNECTED     6426     /run/dbus/system_bus_socket
    unix  3      [ ]         STREAM     CONNECTED     12655    /run/dbus/system_bus_socket
    unix  3      [ ]         DGRAM      CONNECTED     1701     
    unix  3      [ ]         STREAM     CONNECTED     6297     
    unix  3      [ ]         STREAM     CONNECTED     6016     /run/dbus/system_bus_socket
    unix  3      [ ]         STREAM     CONNECTED     6698     
    unix  3      [ ]         STREAM     CONNECTED     5528     
    unix  3      [ ]         DGRAM      CONNECTED     12652    
    unix  3      [ ]         STREAM     CONNECTED     8036     /var/lib/amazon/ssm/ipc/health
    unix  2      [ ]         DGRAM                    6265     
    unix  2      [ ]         STREAM     CONNECTED     12173    
    unix  3      [ ]         DGRAM      CONNECTED     12651    
    unix  3      [ ]         STREAM     CONNECTED     7087     
    unix  2      [ ]         DGRAM      CONNECTED     13585    
    unix  2      [ ]         DGRAM      CONNECTED     12627    
    unix  3      [ ]         STREAM     CONNECTED     8184     /run/systemd/journal/stdout
    unix  3      [ ]         STREAM     CONNECTED     6700     
    unix  3      [ ]         STREAM     CONNECTED     5529     /run/systemd/journal/stdout
    unix  3      [ ]         STREAM     CONNECTED     13584    /run/systemd/journal/stdout
    unix  3      [ ]         STREAM     CONNECTED     12602    /run/systemd/journal/stdout
    unix  2      [ ]         DGRAM      CONNECTED     1846     
    unix  3      [ ]         STREAM     CONNECTED     12854    
    unix  3      [ ]         STREAM     CONNECTED     6987     /run/systemd/journal/stdout
    unix  3      [ ]         STREAM     CONNECTED     13601    
    unix  3      [ ]         STREAM     CONNECTED     7081     /run/dbus/system_bus_socket
    unix  3      [ ]         STREAM     CONNECTED     6709     /run/dbus/system_bus_socket
    unix  3      [ ]         DGRAM      CONNECTED     1702     
    unix  3      [ ]         STREAM     CONNECTED     6298     /run/dbus/system_bus_socket
    unix  3      [ ]         SEQPACKET  CONNECTED     6570     
    unix  2      [ ]         DGRAM      CONNECTED     6569     /run/chrony/chronyd.sock
    unix  3      [ ]         DGRAM      CONNECTED     5555     
    unix  2      [ ]         DGRAM      CONNECTED     6720     
    unix  3      [ ]         DGRAM      CONNECTED     5554     
    unix  2      [ ]         DGRAM      CONNECTED     6406     
    unix  3      [ ]         STREAM     CONNECTED     12599    
    unix  3      [ ]         STREAM     CONNECTED     8183     
    unix  3      [ ]         STREAM     CONNECTED     6701     /run/systemd/journal/stdout
    unix  3      [ ]         STREAM     CONNECTED     6015     /run/dbus/system_bus_socket
    unix  3      [ ]         STREAM     CONNECTED     12855    
    unix  2      [ ]         DGRAM      CONNECTED     12610    
    unix  3      [ ]         STREAM     CONNECTED     8032     
    unix  2      [ ]         DGRAM      CONNECTED     5543     
    unix  2      [ ]         DGRAM      CONNECTED     6535     
    unix  3      [ ]         DGRAM      CONNECTED     5556     
    unix  3      [ ]         STREAM     CONNECTED     8033     /var/lib/amazon/ssm/ipc/termination
    unix  3      [ ]         SEQPACKET  CONNECTED     6571     
    unix  3      [ ]         STREAM     CONNECTED     7088     /run/dbus/system_bus_socket
    unix  2      [ ]         DGRAM      CONNECTED     12534    
    unix  3      [ ]         STREAM     CONNECTED     6422     @572d87868f1cfb04/bus/systemd-logind/system
    unix  3      [ ]         STREAM     CONNECTED     5752     @b6db2c79f8edf803/bus/systemd-resolve/bus-api-resolve
    unix  3      [ ]         STREAM     CONNECTED     6183     @3b8c14e4b0ddfac2/bus/systemd/bus-api-system
    unix  3      [ ]         STREAM     CONNECTED     5753     @3e4ae8817dd31b49/bus/systemd-network/bus-api-network
    unix  3      [ ]         STREAM     CONNECTED     12654    @a561275b38fb4648/bus/systemd/bus-system
    ```


- `netstat -an`
    - `-a`
        - all. display all active connections (both incoming and outgoing), including those that are listening for incoming connections.
        = shows both established connections and listening ports (i.e., ports that are waiting for incoming connections).
    - `-n`
        - numeric. forces netstat to display addresses and port numbers in their numeric form rather than resolving and displaying hostnames or service names.
        - it will show an IP address like 192.168.1.1 instead of trying to resolve it to a domain name, and port 80 instead of displaying "http."


- current routing table
    - `Gateway: 0.0.0.0`: This indicates that the destination network or IP address is reachable directly through the local network interface without needing to route through a specific gateway. Essentially, it means that the network or subnet defined in the route is directly accessible from the local machine.
    ```
    ~$ netstat -r
    Kernel IP routing table
    Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
    default         ip-172-31-16-1. 0.0.0.0         UG        0 0          0 enX0
    ip-172-31-0-2.e ip-172-31-16-1. 255.255.255.255 UGH       0 0          0 enX0
    172.31.16.0     0.0.0.0         255.255.240.0   U         0 0          0 enX0
    ip-172-31-16-1. 0.0.0.0         255.255.255.255 UH        0 0          0 enX0
    ```


- Connection from EC2 instance 172.31.31.20:34488 to 209.54.183.5 over HTTPS established

    ```
    ~$ netstat | grep -i established
    tcp        0      0 ip-172-31-31-20.e:34488 209.54.183.5:https      ESTABLISHED
    tcp6       0      0 ip-172-31-31-20.ec2:ssh ec2-18-206-107-28:39353 ESTABLISHED
    ```
