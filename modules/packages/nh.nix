{pkgs, ...}: 

{
  environment = {
    sessionVariables = {
      FLAKE = "/home/jwrhine/nixos";
    };  
    systemPackages = with pkgs; [
      nh
      nix-current-generation
      ];
  };
}


