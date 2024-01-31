{ config, lib, pkgs, ... }:

{
  services = {
    emacs = {
      enable = true;
      package = pkgs.emacs29;
      install = true;
    };
  };
}
