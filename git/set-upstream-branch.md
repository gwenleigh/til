# Set upstream branch

When you rename a branch locally and want to push it to a remote with the `NEW_NAME`, you need to **update the tracking information**.

1) If you haven't done so, rename the local branch to `NEW_NAME`.
- `git branch -m OLD_NAME NEW_NAME`  

2) Update the upstream branch for your newly named local branch to point to the new remote branch.  
- `git push -u origin NEW_NAME`

2) Delete the Old Remote Branch. 
(I haven't done this because I didn't see the `OLD_NAME` in my remote repo.)
- `git push origin --delete OLD_NAMD`

### Examples
0) After having renamed both local and remote branch, I tried to `git push` and encountered the following error: 
```
$ git push
fatal: The upstream branch of your current branch does not match
the name of your current branch.  To push to the upstream branch
on the remote, use

    git push origin HEAD:2024-06-w1

To push to the branch of the same name on the remote, use

    git push origin HEAD

To choose either option permanently, see push.default in 'git help config'.

To avoid automatically configuring an upstream branch when its name
won't match the local branch, see option 'simple' of branch.autoSetupMerge
in 'git help config'.

lunit@miaj16 til % git push origin git push origin HEAD:2024-06-week-01
error: src refspec git does not match any
error: src refspec push does not match any
```


2) Update the upstream branch (local branch --> new remote branch)
```
 git push -u origin 2024-06-week-01

Enumerating objects: 9, done.
Counting objects: 100% (9/9), done.
Delta compression using up to 16 threads
Compressing objects: 100% (6/6), done.
Writing objects: 100% (7/7), 1.62 KiB | 1.62 MiB/s, done.
Total 7 (delta 1), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/gwenleigh/til.git
   0661d8f..7e5b8a8  2024-06-week-01 -> 2024-06-week-01
branch '2024-06-week-01' set up to track 'origin/2024-06-week-01'.
```
