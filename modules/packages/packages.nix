{ config, pkgs, lib, ... }:

{
  programs = {
    nano = {
      enable = false;
    };
  };

  environment = {
    shells = with pkgs; [ zsh ];
    systemPackages = with pkgs; [
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
