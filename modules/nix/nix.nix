{ config, lib, pkgs, ... }:

{

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      delete_generations = "+5"; # Option added by nix-gc-env
      options = "--delete-older-than 7d";   
    };
    settings = {
      experimental-features = [ 
        "nix-command"
	"flakes"
      ];
      auto-optimise-store = true;
      builders-use-substitutes = true;
      trusted-users = [ 
        "root"
	"jwrhine"
	"@wheel"
      ];
    };
    extraOptions = ''
      warn-dirty = false
    '';

  };

  # I am commenting this out til I know what it does...

#  environment = {
#    variables = { 
#      NIX_SSHOPS = "-t";
#    };
#  };

  # Additional config for nixpkgs, mainly unfree due to Discord, Steam etc

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
