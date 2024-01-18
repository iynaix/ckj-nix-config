{ config, pkgs, lib, ... }:

{
  programs = {
    steam = {
      enable = true;
      remotePlay = {
        openFirewall = true; # Open ports in the Firewall for Steam Remote Play
      };
      dedicatedServer = {
        openFirewall = true; # Open ports in the Firewall for Steam to Source a Dedicated Server
      };
    };
  };
}
