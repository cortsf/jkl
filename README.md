# Assumptions
- `~/.dotfiles/nixos/flake.nix` providing `nixosConfigurations.<HOSTNAME>` (See #2 & #3)

# Usage

``` bash
jkl [extra args passed to nixos-rebuild]
```

# Deps

Only `s - scan` requires [git-secrets](https://github.com/awslabs/git-secrets)
