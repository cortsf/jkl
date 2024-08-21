# Assumptions
- The user has a `~/.dotfiles/nixos/flake.nix` providing `nixosConfigurations.<HOSTNAME>` (See [#2](https://github.com/cortsf/jkl/issues/2) & [#3](https://github.com/cortsf/jkl/issues/3)). Until [#2](https://github.com/cortsf/jkl/issues/2) gets completed, you can use a symlink pointing to a dotfiles repo (with a nixos subfolder) on another location.
 - The user works mostly on branch `main`. Uses other tools for anything else.
- The user doesn't mind automatically generated commit messages. Uses other tools for anything else.
- The user benefits from having some quick shortcuts only to perform the most common/repetitive tasks on a dotfiles repo. Uses other tools for anything else.

Some flexibility could be added in the future, but the idea is to keep this tool as dumb and simple as possible. Check [#7](https://github.com/cortsf/jkl/issues/7)

# Usage

``` bash
$ jkl [extra args passed to nixos-rebuild]
```

`jkl` will show:

1. `git status` followed by:
2. A menu with the following options:

``` 
=================================== Select operations to perform on <HOSTNAME>
a - stage (all)
s - scan
d - diff
f - fetch
g - merge (origin/main)
h - commit & push

j - rebuild
k - commit, push & rebuild
l - commit, push, update flake.lock & rebuild
```

After hitting any of `a`,`s`,`d`,`f`,`g`,`h`,`j`,`k`,`l`, the menu options will disappear, leaving the git status, one colored line message showing the option you choosed:

``` 
h ================================> Commit & push
```

And the outpout of the choosen actions being performed, after this line.

`a - stage` and `d - diff` are recursive, after the choosen actions (`git add .` / `git diff --color=always | less`) are perfomed the menu opens again, with the git status updated in case of `a - stage`.


`jkl` Doesn't clears the scrollback buffer of your terminal, meaning, at any time after using jkl, (at least, before you kill/clear your terminal) you can inspect both the git status, the choosen action/s from the menu, and the output of the choosen actions. Just like with regular git used from a terminal.
# Screenshots
Before choosing action/s:
![alt text](https://github.com/cortsf/jkl/blob/main/jkl1.png?raw=true)

After choosing action/s with `j`:
![alt text](https://github.com/cortsf/jkl/blob/main/jkl2.png?raw=true)

# Note on the program's name (`jkl`)
It's not a joke. These three consecutive keys used to write the program name on a terminal, the `<Control-J>` you can use to submit the program on most terminals, and any of the (most likely to be used) `j`,`k`,`l` actions, can be pressed in sequence with a gesture of the hand, that doesn't even qualifies as writing. It takes less than a second to use this command, if you memorize at least the action/s that you use the most.

# Extra deps
Only `s - scan` requires [git-secrets](https://github.com/awslabs/git-secrets). You have to provide a secrets provider, using for example: 

``` bash
git secrets --add-provider -- cat ~/.my_secrets
```

