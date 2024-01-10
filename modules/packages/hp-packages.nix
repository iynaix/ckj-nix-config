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
      krita
      libsForQt5.kcalc
      lm_sensors
      lsd
      mako
      neofetch
      neovim
      wget
      ];
  };
}
