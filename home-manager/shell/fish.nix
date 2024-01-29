{ config, pkgs, lib, ... }:

{
  programs = {
    fish = {
      enable = true;
    };
    kitty = {
      settings = {
        shell = "fish";
      };
    };
  };
}
