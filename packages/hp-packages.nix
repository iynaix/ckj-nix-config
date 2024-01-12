{ config, pkgs, lib, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      krita
      libsForQt5.kcalc
    ];
  };
}
