{ config, pkgs, lib, ... }:

{
  programs = {
    nano = {
      enable = false;
    };
  };
  
  environment = {
    variables = {
     EDITOR = "nvim";
    };
    shells = with pkgs; [ zsh ];
    systemPackages = with pkgs; [
      cbonsai
      fastfetch
      firefox
      kitty
      lm_sensors
      lsd
      mako
      neofetch
      neovim
      wallust
      wget
    ];
  };

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
