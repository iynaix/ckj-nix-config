{ config, pkgs, lib, ... }:

{
  xdg = {
    configFile = {
      "autostart" = {
        source = ./autostart;
        recursive = true;
      };
      "bspwm" = {
        source = ./bspwm;
        recursive = true;
      };
      "doom" = {
        source = ./doom;
        recursive = true;
      };
      "dunst" = {
        source = ./dunst;
        recursive = true;
      };
      "fastfetch" = {
        source = ./fastfetch;
        recursive = true;
      };
      "hypr" = {
        source = ./hypr;
        recursive = true;
      };
      "i3" = {
        source = ./i3;
        recursive = true;
      };
      "i3status" = {
        source = ./i3status;
        recursive = true;
      };
      "kitty" = {
        source = ./kitty;
        recursive = true;
      };	
      "mako" = {
        source = ./mako;
        recursive = true;
      };	
      "neofetch" = {
        source = ./neofetch;
        recursive = true;
      };
      "nvim" = {
        source = ./nvim;
        recursive = true;
      };
      "polybar" = {
        source = ./polybar;
        recursive = true;
      };
      "qtile" = {
        source = ./qtile;
        recursive = true;
      };
      "ranger" = {
        source = ./ranger;
        recursive = true;
      };
      "rofi" = {
        source = ./rofi;
        recursive = true;
      };
      "spotify" = {
        source = ./spotify;
        recursive = true;
      };
      "sxhkd" = {
        source = ./sxhkd;
        recursive = true;
      };
      "waybar" = {
        source = ./waybar;
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
