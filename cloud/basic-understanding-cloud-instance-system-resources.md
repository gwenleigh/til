# Understanding cloud instance system resources

```
Welcome to Ubuntu 24.04 LTS (GNU/Linux 6.8.0-1012-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sun Sep  8 12:59:33 UTC 2024

  System load:  0.08              Temperature:           -273.1 C
  Usage of /:   23.1% of 6.71GB   Processes:             116
  Memory usage: 24%               Users logged in:       0
  Swap usage:   0%                IPv4 address for ens5: 172.31.40.90
```

- I just spinned up an AWS EC2 instance and the above is what I see when I open a Connect terminal.
- I have only one text file of 10 lines stored on this instance. Why are there 116 processes running?
- I just turned it on and the memory usage is 24% (23.1% of 6.71GB). Why is it so high?

## Memory usage

The high number of processes (116) and the 24% memory usage, even though the EC2 instance is mostly idle, are **typical for a Linux server that just started up**. Several background processes and services are running to manage the system, handle networking, security, and logging, among others.

**Contributing factors**
- **System Services**: Even if you haven't installed anything yet, the Ubuntu system includes a variety of default services (e.g., systemd, networking, security services like ufw, logging daemons like rsyslog, etc.). Each of these services counts as a process.

- **Kernel Threads**: Processes related to the Linux kernel and hardware management (like device drivers) also contribute to the process count.

- **Memory Usage**: Linux typically uses free memory for caching and other purposes. Even if you aren't actively running applications, some of your memory is used for system caching, which is normal. Also, some memory is allocated for kernel buffers and the operating system itself.

## `top`
```
top - 13:03:21 up 4 min,  1 user,  load average: 0.00, 0.00, 0.00
Tasks: 111 total,   1 running, 110 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :    914.2 total,    463.7 free,    342.4 used,    259.9 buff/cache     
MiB Swap:      0.0 total,      0.0 free,      0.0 used.    571.8 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND                                                                     
   1314 ubuntu    20   0   12468   5760   3584 R   0.3   0.6   0:00.01 top                                                                         
      1 root      20   0   22008  13252   9540 S   0.0   1.4   0:01.16 systemd                                                                     
      2 root      20   0       0      0      0 S   0.0   0.0   0:00.00 kthreadd                                                                    
      3 root      20   0       0      0      0 S   0.0   0.0   0:00.00 pool_workqueue_release                                                      
      4 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-rcu_g                                                             
      5 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-rcu_p                                                             
      6 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-slub_                                                             
      7 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/R-netns                                                             
      8 root      20   0       0      0      0 I   0.0   0.0   0:00.00 kworker/0:0-events                                                          
      9 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/0:0H-events_highpri                                                 
     10 root      20   0       0      0      0 I   0.0   0.0   0:00.02 kworker/0:1-rcu_gp     
        ... 
     186 root      rt   0  288948  27008   8704 S   0.0   2.9   0:00.10 multipathd                                                                  
    192 root      20   0   26468   8272   5200 S   0.0   0.9   0:00.15 systemd-udevd                                                               
    330 systemd+  20   0   21588  12800  10624 S   0.0   1.4   0:00.14 systemd-resolve                                                             
    467 systemd+  20   0   22396   9856   8704 S   0.0   1.1   0:00.04 systemd-network                                                             
    506 root      20   0    2720   1920   1792 S   0.0   0.2   0:00.00 acpid                                                                       
    510 root      20   0    7224   2688   2432 S   0.0   0.3   0:00.00 cron                                                                        
    511 message+  20   0    9804   5504   4736 S   0.0   0.6   0:00.07 dbus-daemon                                                                 
    517 root      20   0   82920   4096   3840 S   0.0   0.4   0:00.04 irqbalance                                                                  
    519 root      20   0   32456  20608  10496 S   0.0   2.2   0:00.13 networkd-dispat                                                             
    520 polkitd   20   0  383076   9356   7424 S   0.0   1.0   0:00.10 polkitd                                                                     
    525 root      20   0 1758084  18172  10240 S   0.0   1.9   0:00.59 amazon-ssm-agen                                                             
    532 root      20   0 1843084  30540  20864 S   0.0   3.3   0:00.31 snapd                                                                       
    542 root      20   0   17980   8704   7680 S   0.0   0.9   0:00.07 systemd-logind                                                              
    551 root      20   0  468988  13568  11520 S   0.0   1.4   0:00.09 udisksd                                                                     
    632 root      20   0  109988  22912  13568 S   0.0   2.4   0:00.11 unattended-upgr                                                             
    649 _chrony   20   0   19388   3652   2944 S   0.0   0.4   0:00.05 chronyd                                                                     
    653 _chrony   20   0   11060   2272   1792 S   0.0   0.2   0:00.00 chronyd                                                                     
    660 syslog    20   0  222508   6144   4608 S   0.0   0.7   0:00.06 rsyslogd                                                                    
    715 root      20   0  318144  12544  10880 S   0.0   1.3   0:00.07 ModemManager                                                                
    760 root      20   0   12020   8064   7040 S   0.0   0.9   0:00.01 sshd                                                                        
    762 root      20   0   14704   8436   6784 S   0.0   0.9   0:00.01 sshd                                                                        
    789 root      20   0    6148   2048   1920 S   0.0   0.2   0:00.00 agetty                                                                      
    793 root      20   0    6104   2048   1920 S   0.0   0.2   0:00.00 agetty                                                                      
    919 root      20   0 1840740  27252  16384 S   0.0   2.9   0:01.01 ssm-agent-worke                                                             
    1176 root      -2   0       0      0      0 S   0.0   0.0   0:00.00 psimon                                                                      
    1178 ubuntu    20   0   20228  11264   9344 S   0.0   1.2   0:00.08 systemd                                                                     
    1179 ubuntu    20   0   21144   3476   1792 S   0.0   0.4   0:00.00 (sd-pam)                                                                    
    1290 ubuntu    20   0   14960   6940   4992 S   0.0   0.7   0:00.12 sshd                                                                        
    1291 ubuntu    20   0    9056   5120   3584 S   0.0   0.5   0:00.02 bash                                                                        
    1314 ubuntu    20   0   12468   5760   3584 R   0.0   0.6   0:00.83 top                                                                         
    1326 root      20   0       0      0      0 I   0.0   0.0   0:00.00 kworker/1:0-cgroup_destroy                                                  
    1349 root      20   0       0      0      0 I   0.0   0.0   0:00.00 kworker/1:1-mm_percpu_w            
```

The output from top indicates that my EC2 instance is largely idle, with the CPU usage at 0% and only one process actively running (top itself). 

- Processes: You have 111 total tasks, with 110 in the sleeping state and only 1 actively running (top). This is typical for a Linux system, where many background processes (e.g., services, daemons) remain idle (sleeping) until they're needed.

- Memory:
    - Total memory: 914.2 MiB (about 1 GB).
    - Free memory: 463.7 MiB.
    - Used memory: 342.4 MiB.
    - Buff/cache: 259.9 MiB (Linux uses available memory to cache files for faster access).
    - Swap: No swap space is configured, which is common on instances with limited memory.

The memory usage seems to be mostly system overhead and caching. Linux's memory management system often uses as much RAM as possible for caching to optimize performance, so even if memory is being used, it's not necessarily an indication of inefficiency.


## `ps aux --sort=-%mem`

- `ps aux --sort=-%mem`: report a snapshot of the current processes
    - `a`: Select all processes
    - `u`: Select by effective user ID (EUID) or name.

```
:~$ ps aux --sort=-%mem 
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         532  0.0  3.2 1843084 30540 ?       Ssl  12:59   0:00 /usr/lib/snapd/snapd
root         919  0.0  2.9 1840740 27252 ?       Sl   12:59   0:01 /snap/amazon-ssm-agent/7993/ssm-agent-worker
root         186  0.0  2.8 288948 27008 ?        SLsl 12:59   0:00 /sbin/multipathd -d -s
root         632  0.0  2.4 109988 22912 ?        Ssl  12:59   0:00 /usr/bin/python3 /usr/share/unattended-upgrades/unattended-upgrade-shutdown --wa
root         519  0.0  2.2  32456 20608 ?        Ss   12:59   0:00 /usr/bin/python3 /usr/bin/networkd-dispatcher --run-startup-triggers
root         525  0.0  1.9 1758084 18172 ?       Ssl  12:59   0:00 /snap/amazon-ssm-agent/7993/amazon-ssm-agent
root         124  0.0  1.5  66872 14832 ?        S<s  12:59   0:00 /usr/lib/systemd/systemd-journald
root         551  0.0  1.4 468988 13568 ?        Ssl  12:59   0:00 /usr/libexec/udisks2/udisksd
root           1  0.1  1.4  22008 13252 ?        Ss   12:59   0:01 /sbin/init
systemd+     330  0.0  1.3  21588 12800 ?        Ss   12:59   0:00 /usr/lib/systemd/systemd-resolved
root         715  0.0  1.3 318144 12544 ?        Ssl  12:59   0:00 /usr/sbin/ModemManager
ubuntu      1178  0.0  1.2  20228 11264 ?        Ss   12:59   0:00 /usr/lib/systemd/systemd --user
systemd+     467  0.0  1.0  22396  9856 ?        Ss   12:59   0:00 /usr/lib/systemd/systemd-networkd
polkitd      520  0.0  0.9 383076  9356 ?        Ssl  12:59   0:00 /usr/lib/polkit-1/polkitd --no-debug
root         542  0.0  0.9  17980  8704 ?        Ss   12:59   0:00 /usr/lib/systemd/systemd-logind
root         762  0.0  0.9  14704  8436 ?        Ss   12:59   0:00 sshd: ubuntu [priv]
root         192  0.0  0.8  26468  8272 ?        Ss   12:59   0:00 /usr/lib/systemd/systemd-udevd
root         760  0.0  0.8  12020  8064 ?        Ss   12:59   0:00 sshd: /usr/sbin/sshd -D -o AuthorizedKeysCommand /usr/share/ec2-instance-connect
ubuntu      1290  0.0  0.7  14960  6940 ?        S    12:59   0:00 sshd: ubuntu@pts/0
syslog       660  0.0  0.6 222508  6144 ?        Ssl  12:59   0:00 /usr/sbin/rsyslogd -n -iNONE
ubuntu      1314  0.1  0.6  12468  5760 pts/0    T    13:03   0:01 top
message+     511  0.0  0.5   9804  5504 ?        Ss   12:59   0:00 @dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activati
ubuntu      1291  0.0  0.5   9056  5120 pts/0    Ss   12:59   0:00 -bash
ubuntu      1369  0.0  0.4  11320  4352 pts/0    R+   13:17   0:00 ps aux --sort=-%mem
root         517  0.0  0.4  82920  4096 ?        Ssl  12:59   0:00 /usr/sbin/irqbalance
_chrony      649  0.0  0.3  19388  3652 ?        S    12:59   0:00 /usr/sbin/chronyd -F 1
ubuntu      1179  0.0  0.3  21144  3476 ?        S    12:59   0:00 (sd-pam)
root         510  0.0  0.2   7224  2688 ?        Ss   12:59   0:00 /usr/sbin/cron -f -P
_chrony      653  0.0  0.2  11060  2272 ?        S    12:59   0:00 /usr/sbin/chronyd -F 1
root         789  0.0  0.2   6148  2048 ttyS0    Ss+  12:59   0:00 /sbin/agetty -o -p -- \u --keep-baud 115200,57600,38400,9600 - vt220
root         793  0.0  0.2   6104  2048 tty1     Ss+  12:59   0:00 /sbin/agetty -o -p -- \u --noclear - linux
root         506  0.0  0.2   2720  1920 ?        Ss   12:59   0:00 /usr/sbin/acpid
root           2  0.0  0.0      0     0 ?        S    12:59   0:00 [kthreadd]
root           3  0.0  0.0      0     0 ?        S    12:59   0:00 [pool_workqueue_release]
root           4  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-rcu_g]
root           5  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-rcu_p]
root           6  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-slub_]
root           7  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-netns]
root           9  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/0:0H-events_highpri]
root          11  0.0  0.0      0     0 ?        I    12:59   0:00 [kworker/u4:0-flush-259:0]
root          12  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-mm_pe]
root          13  0.0  0.0      0     0 ?        I    12:59   0:00 [rcu_tasks_rude_kthread]
root          14  0.0  0.0      0     0 ?        I    12:59   0:00 [rcu_tasks_trace_kthread]
root          15  0.0  0.0      0     0 ?        S    12:59   0:00 [ksoftirqd/0]
root          16  0.0  0.0      0     0 ?        I    12:59   0:00 [rcu_sched]
root          17  0.0  0.0      0     0 ?        S    12:59   0:00 [migration/0]
root          18  0.0  0.0      0     0 ?        S    12:59   0:00 [idle_inject/0]
root          19  0.0  0.0      0     0 ?        S    12:59   0:00 [cpuhp/0]
root          20  0.0  0.0      0     0 ?        S    12:59   0:00 [cpuhp/1]
root          21  0.0  0.0      0     0 ?        S    12:59   0:00 [idle_inject/1]
root          22  0.0  0.0      0     0 ?        S    12:59   0:00 [migration/1]
root          23  0.0  0.0      0     0 ?        S    12:59   0:00 [ksoftirqd/1]
root          25  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/1:0H-events_highpri]
root          26  0.0  0.0      0     0 ?        S    12:59   0:00 [kdevtmpfs]
root          27  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-inet_]
root          29  0.0  0.0      0     0 ?        S    12:59   0:00 [kauditd]
root          31  0.0  0.0      0     0 ?        S    12:59   0:00 [khungtaskd]
root          32  0.0  0.0      0     0 ?        S    12:59   0:00 [oom_reaper]
root          33  0.0  0.0      0     0 ?        I    12:59   0:00 [kworker/u4:2-events_unbound]
root          34  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-write]
root          35  0.0  0.0      0     0 ?        S    12:59   0:00 [kcompactd0]
root          36  0.0  0.0      0     0 ?        SN   12:59   0:00 [ksmd]
root          37  0.0  0.0      0     0 ?        SN   12:59   0:00 [khugepaged]
root          38  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-kinte]
root          39  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-kbloc]
root          40  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-blkcg]
root          41  0.0  0.0      0     0 ?        S    12:59   0:00 [irq/9-acpi]
root          42  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-tpm_d]
root          43  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-ata_s]
root          44  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-md]
root          45  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-md_bi]
root          46  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-edac-]
root          47  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-devfr]
root          48  0.0  0.0      0     0 ?        S    12:59   0:00 [watchdogd]
root          49  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/1:1H-kblockd]
root          50  0.0  0.0      0     0 ?        S    12:59   0:00 [kswapd0]
root          51  0.0  0.0      0     0 ?        S    12:59   0:00 [ecryptfs-kthread]
root          52  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-kthro]
root          53  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-acpi_]
root          54  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-nvme-]
root          55  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-nvme-]
root          56  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-nvme-]
root          57  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-nvme-]
root          58  0.0  0.0      0     0 ?        I    12:59   0:00 [kworker/0:2-events]
root          59  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-mld]
root          60  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/0:1H-kblockd]
root          61  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-ipv6_]
root          68  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-kstrp]
root          70  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/u5:0]
root          83  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-charg]
root          84  0.0  0.0      0     0 ?        S    12:59   0:00 [jbd2/nvme0n1p1-8]
root          85  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-ext4-]
root         144  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-kmpat]
root         145  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-kmpat]
root         146  0.0  0.0      0     0 ?        I    12:59   0:00 [kworker/1:2-events]
root         147  0.0  0.0      0     0 ?        I    12:59   0:00 [kworker/u4:3-events_unbound]
root         181  0.0  0.0      0     0 ?        I    12:59   0:00 [kworker/0:3-events]
root         209  0.0  0.0      0     0 ?        S    12:59   0:00 [psimon]
root         255  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-ena]
root         259  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-crypt]
root         287  0.0  0.0      0     0 ?        S    12:59   0:00 [jbd2/nvme0n1p16-8]
root         288  0.0  0.0      0     0 ?        I<   12:59   0:00 [kworker/R-ext4-]
root        1176  0.0  0.0      0     0 ?        S    12:59   0:00 [psimon]
root        1326  0.0  0.0      0     0 ?        I    13:05   0:00 [kworker/1:0-cgroup_destroy]
root        1349  0.0  0.0      0     0 ?        I    13:14   0:00 [kworker/1:1-mm_percpu_wq]
root        1354  0.0  0.0      0     0 ?        I    13:15   0:00 [kworker/u4:1-flush-259:0]
```

- The system's memory usage is dominated by the `snapd` and `amazon-ssm-agent` processes. These are normal background processes, but they are consuming significant memory relative to the overall system load.

Top processes: 
- `/usr/lib/snapd/snapd`: Snapd is the background service that manages snaps on the Linux system. It is using 3.2% of the memory.
- `/snap/amazon-ssm-agent/ssm-agent-worker`: Amazon SSM Agent is responsible for connecting the EC2 instance with AWS services. It is consuming 2.9% of memory.
= `/sbin/multipathd -d -s`: This process handles multipathing for storage devices, using 2.8% of the memory.