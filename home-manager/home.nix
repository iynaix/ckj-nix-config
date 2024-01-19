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

  home = {
    file = {
      "/home/jwrhine/.librewolf/rj5h1ftg.default/chrome/userChrome.css" = {
        source = ./userChrome.css;
        # text = ''<the content of the file here''; if you want nix to create the file
      };
    };
  };  

  home.stateVersion = "23.11";
}
