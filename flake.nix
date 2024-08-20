# {
#   description = "Rebuild shortcuts for nixos";
#   inputs = {
#     nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
#   };
#   outputs = { self, nixpkgs }:
#     let
#       system = "x86_64-linux";
#       pkgs = nixpkgs.legacyPackages.${system};
#     in
#     {
#       packages.${system}.default = pkgs.writeShellApplication {
#         name = "jkl";
#         text = builtins.readFile ./jkl;
#       };
#     };
# }
