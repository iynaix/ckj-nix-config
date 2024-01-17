{ config, ... }: {
  sops.secrets.up.neededForUsers = true;

  users.users.jwrhine = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.up.path;
  };
}
