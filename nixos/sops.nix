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
      userpassword = {
        neededForUsers = true;
      };	
#      example-key = { };
      tailscale = { 
        owner = "jwrhine";
      };
#      "myservice/my_subdir/my_secret" = { }
    };
  };  
}  
