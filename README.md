# Assumptions
- The user has a `~/.dotfiles/nixos/flake.nix` providing `nixosConfigurations.<HOSTNAME>` (See [#2](https://github.com/cortsf/jkl/issues/2) & [#3](https://github.com/cortsf/jkl/issues/3)).
- The user works mostly on branch `main`. Uses other tools for anything else.
- The user doesn't mind automatically generated commit messages. Uses other tools for anything else.
- The user benefits from having some quick shortcuts only to perform the most common/repetitive tasks on a dotfiles repo. Uses other tools for anything else.

# Usage

``` bash
$ jkl [extra args passed to nixos-rebuild]
```

`jkl` will show:

1. git status
2. A menu with the following options:

``` 
=================================== Select operations to perform on <HOSTNAME>
a - stage (all)"
s - scan"
d - diff"
f - fetch"
g - merge (origin/main)"
h - commit & push"

j - rebuild"
k - commit, push & rebuild"
l - commit, push, update flake.lock & rebuild"
```

After hitting any of `a`,`s`,`d`,`f`,`j`,`k`,`l`, the menu options will disappear, leaving the git status, one colored line message showing the option you choosed:

``` 
h ================================> Commit & push"
```

And the outpout of the choosen actions being performed, after this line.

`a - stage` and `d - diff` are recursive, after the choosen actions (stage/diff..) are perfomed the menu opens again, with the git status updated in case of `a - stage`.

# Extra deps
Only `s - scan` requires [git-secrets](https://github.com/awslabs/git-secrets)
