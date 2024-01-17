{config, lib, ...}: {
  options.custom = {
      impermanence.enable = lib.mkEnableOption "impermanence";
  };

  config = lib.mkIf config.custom.impermanence.enable {
    fileSystems."/" = (lib.mkForce {
      device = "tmpfs";
      fsType = "tmpfs";
      options = ["defaults" "size=1G" "mode=755"];
    });
  };
}
