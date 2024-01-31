{user, lib, config, ...}:

{
  users.users.jwrhine.extraGroups = ["docker"];

  virtualisation.docker = {
    enable = true;
    storageDriver = lib.mkIf (config.fileSystems."/".fsType == "zfs") "zfs";
  };

  custom-nixos = {
    persist = {
      root = {
        directories = [
          "/var/lib/docker" # docker directory
        ];
      };
    };
  };
}
