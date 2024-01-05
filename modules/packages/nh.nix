{...}: 

{
  environment = {
    sessionVariables = {
      FLAKE = "~/nixos"
    };  
    systemPackages = with pkgs; [
      nh
      ];
  };
}


