# Rename local and remote branch

Rename local branch
- `git branch -m <old_name> <new_name>`

Rename remote branch (Delete the `old-name` remote branch and push the `new-name` local branch:)
- git push origin :old-name new-name

```
gwen@til % git push origin :2024-06-w1 2024-06-week-01 
Total 0 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To https://github.com/gwenleigh/til.git
 - [deleted]         2024-06-w1
 * [new branch]      2024-06-week-01 -> 2024-06-week-01
```

### References
https://stackoverflow.com/questions/30590083/git-how-to-rename-a-branch-both-local-and-remote