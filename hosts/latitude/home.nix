{ config, pkgs, users, lib, ... }:

{
  programs = {
    obs-studio = {
      enable = true;
    };
  };  
}
