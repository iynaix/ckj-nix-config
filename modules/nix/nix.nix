{ config, lib, pkgs, ... }:

{

  nix = {
    gc = {
      automatic = true;
      dates = "*-*-* 12:00:00";
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

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
