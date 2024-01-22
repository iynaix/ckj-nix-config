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
      firefox
      kitty
      lm_sensors
      lsd
      mako
      neofetch
      neovim
      wallust
      wget
    ];
  };
}
