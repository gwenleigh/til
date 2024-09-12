# `tcpdump`

- `tcpdump -D`: lists all available network interfaces on your system along with their status. 

    ```
    1.en5 [Up, Running, Connected]
    2.en0 [Up, Running, Wireless, Associated]
    3.awdl0 [Up, Running, Wireless, Associated]
    ```

- `sudo tcpdump -i ens5 -s0 -w sample.pcap`
    - `-i`: Captures incoming and outcoming packets for interface (-i)
    - `-s0`: Sets the snaplengh (-s) to the maximum size.

- filter out: `tcpdump -r sample.pcap host <target_IP> and port <port_num>` 