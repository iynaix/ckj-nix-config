{
  inputs = {
    nixpkgs.url = "github:Nixos/nixpkgs/nixos-unstable";
    # sops-nix.url = "github:Mic92/sops-nix";
    # optional, not necessary for the module
    # sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
#    sops-nix,
    ...
  }:

  {
    nixosConfigurations = let
      user = "jwrhine";
      mkHost = host:
        nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";

          specialArgs = {
            inherit (nixpkgs) lib;
            inherit inputs nixpkgs system user;
          };

          modules = [
 #           sops-nix.nixosModules.sops
	    inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${user} = {
                  imports = [
                    # common home-manager configuration
                    ./home.nix
                    # host specific home-manager configuration
                    # ./hosts/${host}/home.nix
                  ];

                  home = {
                    username = user;
                    homeDirectory = "/home/${user}";
                    # do not change this value
                    stateVersion = "23.11";
                  };

                  # Let Home Manager install and manage itself.
                  programs.home-manager.enable = true;
                };
              };
            }
            # common configuration
            ./configuration.nix
            # host specific configuration
            ./hosts/${host}/configuration.nix
            # host specific hardware configuration
            ./hosts/${host}/hardware-configuration.nix
          ];
        };
    in {
      # update with `nix flake update`
      # rebuild with `nixos-rebuild switch --flake .#latitude`
      laptop = mkHost "latitude";
      # update with `nix flake update`
      # rebuild with `nixos-rebuild switch --flake .#desktop`
      hp-desktop = mkHost "desktop";
    };

      };
    }
