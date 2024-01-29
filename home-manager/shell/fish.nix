{ config, pkgs, lib, ... }:

{
  programs = {
    fish = {
      enable = true;
    };
    kitty = {
      shell = "fish";
    };
  };
}
