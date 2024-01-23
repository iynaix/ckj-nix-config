{ config, pkgs, lib, ... }:

{
  xdg = {
    configFile = {
      "doom" = {
        source = ./doom;
        recursive = true;
      };
      "fastfetch" = {
        source = ./fastfetch;
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

  home = {
    file = {
      "/home/jwrhine/.librewolf/ca1rhbaa.default/" = {
        source = ./Chrome;
        recursive = true;
        # text = ''<the content of the file here''; if you want nix to create the file
      };
    };
  };  

  home.stateVersion = "23.11";
}
