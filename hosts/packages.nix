{ config, pkgs, lib, ... }:

{
  programs = {
    nano = {
      enable = false;
    };
  };

  environment = {
    variables = {
     EDITOR = "nvim";
    };
    systemPackages = with pkgs; [
      cbonsai
      fastfetch
      feh
      lm_sensors
      lsd
      neofetch
      # fix nix package count for nitch
      (pkgs.nitch.overrideAttrs (o: {
        patches = (o.patches or []) ++ [../overlays/nitch-nix-pkgs-count.patch];
      }))
      wallust
      wget
    ];
  };
}
