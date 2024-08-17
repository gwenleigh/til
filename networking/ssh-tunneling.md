# SSH Tunneling

An SSH tunnel is a method of securely forwarding data between a local and a remote computer over an encrypted SSH (Secure Shell) connection. It essentially creates a secure "tunnel" through which data can be transmitted safely. 

**Port Forwarding**: SSH tunneling is often used to redirect network traffic from one port to another, either on the same machine or on a different machine. This can be useful for accessing services behind a firewall or on a private network.

**Local Port Forwarding**: Redirects traffic from a local port to a remote server. For example, accessing a remote web server through a local port.
**Remote Port Forwarding**: Redirects traffic from a remote server to a local machine. For example, allowing a remote server to access a local web server.
**Dynamic Port Forwarding**: Uses the SOCKS protocol to dynamically forward traffic through an SSH tunnel. This is useful for accessing multiple remote services through a single SSH connection.
