{config, lib, ...}: {
  options.custom = {
      impermanence.enable = lib.mkEnableOption "impermanence";
  };

  config = lib.mkIf config.custom.impermanence.enable {
    fileSystems."/" = lib.mkForce {
      device = "tmpfs";
      fsType = "tmpfs";
      options = ["defaults" "size=1G" "mode=755"];
    };

#    users = {
#      users = {
#        root = {
#	  hashedPasswordFile = config.sops.secrets.rp.path;
#	};
#        jwrhine = {
#	  hashedPasswordFile = config.sops.secrets.up.path;
#	};
#      };
#    };

    environment.persistence."/persist" = {
      hideMounts = true;
      directories = [
        "/etc/NetworkManager/system-connections"
        "/etc/ssh"
        # "/var/lib/bluetooth"
        # "/var/lib/nixos"
        # "/var/lib/systemd/coredump"
        "/var/log"
        # { directory = "/var/lib/colord"; user = "colord"; group = "colord"; mode = "u=rwx,g=rx,o="; }
      ]
      ++ config.custom.persist.root.directories;
      files = [
        # "/etc/machine-id"
        # { file = "/var/keys/secret_file"; parentDirectory = { mode = "u=rwx,g=,o="; }; }
      ];
      users.jwrhine = {
        directories = [
          # "Downloads"
          # "Music"
          # "Pictures"
          # "Documents"
          # "Videos"
          # "VirtualBox VMs"
          # { directory = ".gnupg"; mode = "0700"; }
          # { directory = ".ssh"; mode = "0700"; }
          # { directory = ".nixops"; mode = "0700"; }
          # { directory = ".local/share/keyrings"; mode = "0700"; }
          # ".local/share/direnv"
        ];
        files = [
          # ".screenrc"
        ];
      };
    };
  };
}
