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
      cmatrix
      firefox
      gimp
      glib
      jq
      killall
      kitty
      libimobiledevice
      libnotify
      librewolf
      lm_sensors
      lsd
      mako
      neofetch
      neovim
      pkgs.python311Full
      wget
      ];
  };
}
