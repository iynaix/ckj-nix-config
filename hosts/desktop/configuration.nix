{ config, pkgs, ... }:

{
  imports =
    [
      ./default.nix
      ./hardware-configuration.nix
      ./packages.nix
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
        initialPassword = "password";
	hashedPasswordFile = config.sops.secrets.ar.path;
      };
      gcreed = {
        isNormalUser = true;
        description = "Gavin";
        initialPassword = "password";
	hashedPasswordFile = config.sops.secrets.gr.path;
      };
    };
  };
}
