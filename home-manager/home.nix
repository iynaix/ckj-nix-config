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
      ".librewolf/ca1rhbaa.default/chrome/userChrome.css" = {
        source = ./chrome/userChrome.css;
        # text = ''<the content of the file here''; if you want nix to create the file
      };
    };
  };  

  home.stateVersion = "23.11";
}
