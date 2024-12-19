{
  description = "Rebuild shortcuts for nixos";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system}.default = pkgs.writeShellApplication {
        name = "jkl";
        runtimeInputs = with pkgs; [ bash ncurses less nix git git-secrets ];
        text = builtins.readFile ./jkl;
        bashOptions = [ ];
      };
    };
}
