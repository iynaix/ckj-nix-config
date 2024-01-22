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
    shells = with pkgs; [ zsh ];
    systemPackages = with pkgs; [
      cbonsai
      fastfetch
      firefox
      kitty
      lm_sensors
      lsd
      mako
      neofetch
      neovim
      # fix nix package count for nitch
      (pkgs.nitch.overrideAttrs (o: {
        patches = (o.patches or []) ++ [../overlays/nitch-nix-pkgs-count.patch];
      }));
      wallust
      wget
    ];
  };
}
