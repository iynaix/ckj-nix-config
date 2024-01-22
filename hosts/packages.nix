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
      nim2
      nitch
      wallust
      wget
    ];
  };
}
