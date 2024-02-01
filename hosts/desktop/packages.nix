{ config, pkgs, lib, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      firefox
      krita
      libreoffice
      libsForQt5.kcalc
    ];
  };
}
