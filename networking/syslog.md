# Syslog (System Logging Protocol)
A standard protocol used for message logging within computer systems, particularly on Unix-like operating systems. It is designed to allow different systems and devices to send log messages about events, diagnostics, and errors to a central log server or log file. 

**[Excerpts from Sliceup.co](https://www.sliceup.co/post/what-is-syslog)**
- Syslog consists of three layers: content, application, and transport. 
- The protocol allows various devices, such as routers, switches, firewalls, and servers, to send syslog messages to a centralized syslog server.
- Syslog message structure:
  - A header containing: version, timestamp, host name, priority, application, process ID, and message ID
  - Structured data composed of data blocks in a specific format 
  - Log message itself 
- Primarily employs UDP for transmission via port 514.

## Log message format
- **PRI (Priority)**: Combines the facility code and severity level of the log message.The Priority Value is calculated by multiplying the Facility value by eight and adding the Severity Value, which helps manage and filter messages based on their importance.
    - `PRI = (facility * 8) + severity`
- **Header**: Contains the timestamp a
nd the hostname or IP address of the device that generated the log message.
- **Message**: The actual content of the log message, which includes information about the event that occurred.

### Severity levels
- **Emergency (0)**: System is unusable.
- **Alert (1)**: Action must be taken immediately.
- **Critical (2)**: Critical conditions.
- **Error (3)**: Error conditions.
- **Warning (4)**: Warning conditions.
- **Notice (5)**: Normal but significant condition.
- **Informational (6)**: Informational messages.
- **Debug (7)**: Debug-level messages.

### Examples
![Syslog format, from Sliceup.co](https://assets-global.website-files.com/6423544541c7fcf091dc5bab/647ba6f19990bad204e18e28_syslog%20message%20format%20.png)

Format
```
<34>May 30 12:34:56 myhostname myapp[12345]: This is a sample log message.
```
Kernel message
```
<0>May 30 12:34:56 myhostname kernel: [0.000000] Initializing cgroup subsys cpuset
```
Authentication failure
```
<37>May 30 12:34:56 myhostname sshd[6789]: Failed password for invalid user root from 192.168.1.100 port 22 ssh2
```
Mail system message
```
<69>May 30 12:34:56 myhostname postfix/smtpd[2468]: connect from unknown[192.168.1.200]
```

## Purpose and use
- **Centralized Logging**: Syslog facilitates the collection and storage of log messages **from multiple devices** in a centralized location, making it easier to monitor and analyze system activity.
- **Event Reporting**: It is used to report **system events** such as startup messages, shutdown messages, application logs, security alerts, and other system activities.
- **Troubleshooting**: Syslog helps in diagnosing and troubleshooting system issues by providing a detailed log of events and errors.

## Componenets
- **Syslog Client**: the source of log. The component that generates log messages and sends them to the Syslog daemon. This can be an application, a system service, or a network device.
- **Syslog Daemon (syslogd or rsyslogd)**: the log handler. The daemon running on a system that collects log messages and stores them in log files or forwards them to a remote Syslog server.
- **Syslog Server**: the log receiver. A central server that receives log messages from multiple clients, processes them, and stores them for analysis and archiving.

    ![Syslog server setup, original image source https://cdn.networkmanagementsoftware.com](https://assets-global.website-files.com/6423544541c7fcf091dc5bab/647ba9ee381b7697980104f4_syslog%20server%20setup%20.jpeg)

## Transport and protocol
- **Transport**: Syslog messages are typically sent over UDP (User Datagram Protocol) on port 514. However, TCP (Transmission Control Protocol) can also be used for more reliable transmission.
- **RFC Standards**: Syslog is defined by several RFCs, with RFC 3164 describing the original protocol, and RFC 5424 providing the enhanced and more structured format.

## Facility codes 

| Facility Code | Facility       | Description                              |
|---------------|----------------|------------------------------------------|
| 0             | kern           | Kernel messages                          |
| 1             | user           | User-level messages                      |
| 2             | mail           | Mail system or mail-related services     |
| 3             | daemon         | System daemons or background services    |
| 4             | auth           | Security/authorization messages          |
| 5             | syslog         | Messages generated internally by syslogd |
| 6             | lpr            | Line printer subsystem                   |
| 7             | news           | Network news subsystem                   |
| 8             | uucp           | UUCP subsystem                           |
| 9             | cron           | Clock daemon (cron and at)               |
| 10            | authpriv       | Security/authorization messages (private)|
| 11            | ftp            | FTP daemon                               |
| 12            | ntp            | NTP subsystem                            |
| 13            | security       | Log audit                                |
| 14            | console        | Log alert                                |
| 15            | solaris-cron   | Scheduling daemon (Solaris)              |
| 16–23         | local0–local7  | Local use, locally defined               |
