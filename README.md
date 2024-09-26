# Assumptions
- The user has a `~/.dotfiles/nixos/flake.nix` providing `nixosConfigurations.<HOSTNAME>`. Until [#7](https://github.com/cortsf/jkl/issues/7) is completed, you can use a symlink pointing to another location.
- The user works mostly on branch `main`. Uses other tools for anything else.
- The user doesn't mind automatically generated commit messages. Uses other tools for anything else.
- The user benefits from having some quick shortcuts only to perform the most common/repetitive tasks on a dotfiles repo. Uses other tools for anything else.

Some flexibility could be added in the future, but the idea is to keep this tool as dumb and simple as possible. Read [Rationale](#rationale) for further explanations.

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
d - diff unstaged
D - diff staged
e - diff origin
f - fetch
g - merge origin
h - commit & push

j - rebuild
k - commit, push & rebuild
l - commit, push, update flake.lock & rebuild
L - update invididual <input>
```

After hitting any of `a`,`s`,`d`,`D`,`e`,`f`,`g`,`h`,`j`,`k`,`l`,`L`, the menu options will disappear, leaving the output of `git status`, one colored line message showing the option you choosed:

``` 
h ================================> Commit & push
```

And the outpout of the choosen actions being performed, after this line.

## Recursive actions
The `a - stage` and `d - diff unstaged`, `D - diff staged`, `e - diff origin` and `f - fetch` options are recursive, after the corresponding actions are perfomed the menu automatically shows again, with the git status updated in case of `a - stage` and `f - fetch`.


`f - fetch` shows `git diff origin/main` after running `git fetch`, unless there is nothing to fetch, in that case it shows the main menu directly.


## Scrollback buffer
`jkl` Doesn't clears the scrollback buffer of your terminal, meaning, at any time after using jkl, (at least, before you kill/clear your terminal) you can inspect both the git status, the choosen action/s from the menu, and the output of the choosen actions. Just like with regular git used from a terminal.

# Screenshots
Before choosing action/s:
![alt text](https://github.com/cortsf/jkl/blob/main/jkl1.png?raw=true)

After choosing action/s with `j`:
![alt text](https://github.com/cortsf/jkl/blob/main/jkl2.png?raw=true)

# Rationale
The program's name (`jkl`) is not a joke. These three consecutive home row keys used to write the program name on a terminal, the `<Control-J>` you can use to submit the program on most terminals, and any of the (most likely to be used) `h`, `j`,`k`,`l` actions, can be pressed in sequence with a gesture of the hand, that doesn't even qualifies as writing. It takes less than a second to use this command, if you memorize at least the action/s that you use the most.

This allows to efficiently try, commit & push any (valid) minuscule tweak in you configuration, almost for ee. Which is specially useful in a multi computer setup sharing the same configuration. This is done while keeping the (clean & readable) history on a terminal, without the user having to chdir into any particular folder or provide a machine name, and with the help of some also efficient wrappers around git fetch, merge, stage, diff and nix input/s update.

# Extra deps
Only `s - scan` requires [git-secrets](https://github.com/awslabs/git-secrets). You have to provide a secrets provider, using for example: 

``` bash
git secrets --add-provider -- gpg -qd /path/to/my_secrets.gpg
```

Where `my_secrets.gpg` is just a text file encrypted with `gpg -c /path/to/my_secrets` (dont forget to remove the -unencrypted- original file)

This is the same as using cat without encryption:

``` bash
git secrets --add-provider -- cat /path/to/my_secrets
```
