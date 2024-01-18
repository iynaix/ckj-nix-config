{ config, pkgs, lib, ... }:

{
  xdg = {
    configFile = {
      "doom" = {
        source = ./doom;
        recursive = true;
      };
      "kitty" = {
        source = ./kitty;
        recursive = true;
      };	
      "neofetch" = {
        source = ./neofetch;
        recursive = true;
      };
    };
  };  

  home.stateVersion = "23.11";
}
