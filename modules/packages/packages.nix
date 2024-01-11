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
      fastfetch
      firefox
      kitty
      lm_sensors
      lsd
      mako
      neofetch
      neovim
      wget
    ];
  };
}
