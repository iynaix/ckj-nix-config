{user, lib, config, ...}:

{
  users.users.jwrhine.extraGroups = ["docker"];

  virtualisation.docker = {
    enable = true;
    storageDriver = lib.mkIf (config.fileSystems."/".fsType == "zfs") "zfs";
  };

#  custom.persist = {
#    home.directories = [
#      "/var/lib/docker" # docker directory
#    ];
#  };
}
