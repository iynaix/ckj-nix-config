{ config, pkgs, lib, ... }:

{
  programs = {
    fish = {
      enable = true;
    };
    kitty = {
      enable = true;
      settings = {
        shell = "fish";
      };
    };
  };
}
