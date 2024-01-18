{ config, pkgs, lib, ... }:

{
  xdg = {
    configFile = {
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
