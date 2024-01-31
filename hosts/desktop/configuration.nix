{ config, pkgs, ... }:

{
  imports =
    [
      ./packages.nix
      ./xfce.nix
    ];

  boot = {
    loader = {
      grub = {
        enable = true;
	device = "/dev/sda";
      };
    };
  };

  networking = {
    hostName = "desktop";
  };

#  powerManagement = {
#    cpuFreqGovernor = "performance";
#  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users = {
      amreed = {
        isNormalUser = true;
        description = "Aiden";
        hashedPasswordFile = config.sops.secrets.ar.path;
	extraGroups = [];
	packages = with pkgs; [];
      };
      gcreed = {
        isNormalUser = true;
        description = "Gavin";
        hashedPasswordFile = config.sops.secrets.gr.path;
	extraGroups = [];
	packages = with pkgs; [];
      };
    };
  };
}
