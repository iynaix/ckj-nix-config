{ pkgs, inputs, config, ... }:

{
  imports =
    [
      inputs.sops-nix.nixosModules.sops
    ];

  sops = {
    defaultSopsFile = ../hosts/secrets.yaml;
    defaultSopsFormat = "yaml";
    age = {
      keyFile = "/home/jwrhine/.config/sops/age/keys.txt";
    };
    secrets = {
#      example-key = { };
      tailscale = { 
        owner = "jwrhine";
      };
      userpassword = {
        neededForUsers = true;
      };	
#      "myservice/my_subdir/my_secret" = { }
    };
  };  
}  
