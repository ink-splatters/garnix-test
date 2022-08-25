{

  description = "garnix CI test";

  inputs = {
    flake-parts.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    treefmt-flake.url = "github:srid/treefmt-flake";
  };

  outputs = { self, flake-parts, treefmt-flake,... }:
    flake-parts.lib.mkFlake { inherit self; } {
      imports = [
       	treefmt-flake.flakeModule
      ];

      systems = [ "x86_64-linux" "aarch64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }: {

		packages.default = pkgs.hello ;

	};
#	      packages.default = pkgs.hello;
##	devShells.default = import ./shell.nix
#      }
  };
}



