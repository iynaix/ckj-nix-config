{ config, lib, pkgs, ... }:

{
  services = {
    emacs = {
      enable = true;
      client = {
        enable = true;
      };
      package = pkgs.emacs29;
      install = true;
      startWithUserSession = true;
    };
  };
}
