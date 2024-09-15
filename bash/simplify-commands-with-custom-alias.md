# Simplify commands with custom alias

Workflow:
1. Open `~/.bashrc` or `~/.zsh`
2. Add an alias or function
    - Alias: `alias [alias_name]=`sh /path/to/your/bash/script.sh`
    - Function
        ```
        readme() {
           sh /path/to/your/project/utils/readme.sh "$@"
        }
        ```
3. `source ~/.bashrc` or `~/.zsh`
4. Run your script with alias :D!

```
nano ~/.zsh

# ~/.zsh
# Add the following line.
alias [alias_name]=`sh /path/to/your/bash/script.sh`
alias readme=`sh /Users/gwen/workspace/airbnb/utils/readme.sh` # example

# Now you can run your alias on terminal!
$ readme
```