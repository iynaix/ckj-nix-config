{ config, pkgs, lib, ... }:

{
  programs = {
    starship = {
      enable = true;
      enableBashInteration = true;
      enableFishInteration = true;
      enableZshInteration = true;
      settings = { };
    };
  };
}
