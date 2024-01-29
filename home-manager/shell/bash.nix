{ config, pkgs, lib, ... }:

{
  programs = {
    bash = {
      enable = true;
      initExtra = ''
        nitch
        cat ~/.cache/wallust/sequences
      '';
    };
  };
}
