# Linux file system

/usr/local/bin  
/usr/local/sbin  
/usr/local/lib  
/usr/local/etc  
/usr/local/opt  
/usr/local/var  

## File system

- `/usr/local`: a standard directory used for installing software and applications that are not part of the core operating system.

    - User-Installed Software: Programs and libraries that you manually install, rather than those provided by the system package manager, are often placed here.
    - Local Executables: Custom scripts or binaries that you want to be available system-wide without affecting system-managed files are stored here.
    - Libraries and Headers: Additional libraries and header files for software development that you install manually.

        - `/usr/local/bin`: contains executable binaries or scripts that are installed manually by the user. It is included in the system's PATH environment variable, making these executables available for use from the command line.

        - `/usr/local/sbin`: Similar to `/usr/local/bin`, but intended for system administration binaries that are not part of the core system. Programs in this directory are often used for system maintenance or administrative tasks.

        - `/usr/local/lib`: This directory holds libraries that are needed by executables in `/usr/local/bin` and `/usr/local/sbin`. These libraries are typically shared libraries or dynamic link libraries (DLLs) that provide functionality to various programs.

        - `/usr/local/etc`: contains configuration files for software installed in `/usr/local`. It is used to store configuration settings that are specific to user-installed applications.

        - `/usr/local/opt`: used by some package management systems (like `Homebrew` on macOS) to store installed packages and their dependencies.

        - `/usr/local/var`: used for variable data files, such as databases or logs, that are used by user-installed software. It typically contains data that changes over time and is specific to the applications in /usr/local.

## Config and variables

- Configuration vs. Variable Data: 
    - `/usr/local/etc` holds static configuration settings that define how software behaves, 
    - `/usr/local/var` holds dynamic data generated and used by applications during their execution.

- Frequency of Change: 
    - Configuration files in `/usr/local/etc` are typically edited by administrators or users to change application behavior, 
    - whereas files in `/usr/local/var` are modified by the application itself during its normal operation.

### /usr/local/etc

- Purpose: This directory is primarily used for configuration files. These are files that contain settings and options used by software applications. Configuration files often include parameters that control the behavior of the software.
- Examples: Configuration files for web servers, database settings, application preferences, etc.
- Nature: These files typically remain static or change infrequently. They define how the software should operate.

### /usr/local/var

- Purpose: This directory is used for variable data that changes over time. It contains files that are frequently modified by applications during their operation.
- Examples: Log files, database files, cache files, and other runtime data.
- Nature: This directory is intended to hold dynamic data that can grow or change as the application runs. It might include things like server logs or user-generated data.