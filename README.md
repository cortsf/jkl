# Assumptions
- The user has a `~/.dotfiles/nixos/flake.nix` providing `nixosConfigurations.<HOSTNAME>` (See [#2](https://github.com/cortsf/jkl/issues/2) & [#3](https://github.com/cortsf/jkl/issues/3)).
- The user works mostly on branch `main`. Uses other tools for anything else.
- The user doesn't mind automatically generated commit messages. Uses other tools for anything else.
- The user benefits from having some quick shortcuts only to perform the most common/repetitive tasks on a dotfiles repo. Uses other tools for anything else.

# Usage

``` bash
$ jkl [extra args passed to nixos-rebuild]
```

# Extra deps
Only `s - scan` requires [git-secrets](https://github.com/awslabs/git-secrets)


