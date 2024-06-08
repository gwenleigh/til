# Logs

In Ubuntu (and other Linux distributions), the `/var/log` directory contains various log files for the system and installed services. 

## Common logs
- `/var/log/syslog`: General system activity log.
- `/var/log/auth.log`: Authentication logs.
- `/var/log/kern.log`: Kernel messages.
- `/var/log/cron.log`: Cron job logs.
- `/var/log/mail.log`: Mail server logs.
- `/var/log/Xorg`.0.log: X server (graphical server) log.
- `/var/log/boot.log`: Boot process log.
- `/var/log/dmesg`: Boot and hardware-related messages.
- `/var/log/faillog`: Failed login attempts.
- `/var/log/wtmp`: Login records.
- `/var/log/btmp`: Failed login attempts.
- `/var/log/lastlog`: Record of the last login of each user.
- `/var/log/user.log`: User-specific logs.
- `/var/log/debug`: Debugging logs.
- `/var/log/mysql`/: Directory containing MySQL server logs:
    - `error.log`: MySQL error log.
- `/var/log/nginx`/: Directory containing Nginx web server logs:
    - `access.log`: Access logs.
    - `error.log`: Error logs.
- `/var/log/ufw.log`: Uncomplicated Firewall (UFW) logs.
- `/var/log/messages`: General system messages (similar to syslog, not always present on all Ubuntu systems).
- `/var/log/apt`/: Directory containing logs related to apt package manager:
    - `history.log`: Package installation history.
    - `term.log`: Terminal output of package installations and upgrades.

## Useful commands
- **`cat`**: Display the entire contents of a file.
- **`less`**: View the file one page at a time.
- **`more`**: Similar to less, but with more limited functionality.
- **`tail -f`**: Continuously display new entries added to the end of a file.
- **`grep`**: Search for specific patterns within the log files.