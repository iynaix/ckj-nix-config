{ config, pkgs, lib, ... }:

{
  xdg = {
    configFile = {
      "kitty/kitty.conf" = {
        source = ./kitty.conf;
      };	
      "neofetch" = {
        source = ./neofetch;
        recursive = true;
      };
    };
  };  

  home.stateVersion = "23.11";
}
