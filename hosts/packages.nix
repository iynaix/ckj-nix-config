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
      bunnyfetch
      cbonsai
      fastfetch
      firefox
      kitty
      leaf
      lm_sensors
      lsd
      mako
      neofetch
      neovim
      owofetch
      wallust
      wget
    ];
  };
}
