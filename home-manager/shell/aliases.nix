{
  home = {
    shellAliases = {
      # Doom Emacs Upgrade
      doom-up="~/.config/emacs/bin/doom upgrade";
      # Git Commands
      ga="git add";
      "ga."="git add .";
      gc="git commit -m";
      gf="git fetch";
      gpull="git pull";
      gpush="git push";
      # Misc. Terminal Commands
      "~"="cd";
      "."="cd ~/dotfiles";
      ".."="cd ..";
      conf="lsd ~/.config";
      la="lsd -a";
      lal="lsd -al";
      ll="lsd -l";
      ls="lsd";
      neo="neofetch";
      rb="reboot";
      tree="lsd -a --tree";
      x="exit";
      # Neovim Commands
      sv="sudo nvim";
      v="nvim";
      # NixOS Commands
      flake="v ~/dotfiles/flake.nix";
      flake-up="cd ~/dotfiles; nix flake update";
      gen-list="sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
      gen-del="sudo nix-env --delete-generations --profile /nix/var/nix/profiles/system";
      home-dell="v ~/dotfiles/hosts/latitude/home.nix"; # Open home.nix file for Dell-Latitude
      home-hp="v ~/dotfiles/hosts/desktop/home.nix"; # Open home.nix file for HP-Desktop
      nc-dell="v ~/dotfiles/hosts/latitude/configuration.nix"; # Open configuration.nix file for Dell-Latitude
      nc-hp="v ~/dotfiles/hosts/desktop/configuration.nix"; # Open configuration.nix file for HP-Desktop
      nrs-dell="nh os switch --nom --hostname latitude"; # Run 'nixos-rebuild switch' for Dell-Latitude
      nrs-hp="nh os switch --nom --hostname desktop"; # Run 'nixos-rebuild switch' for HP-Desktop
      # Scripts
      ko="./dotfiles/scripts/kitty_opacity";
      pow="./dotfiles/scripts/powermenu.sh";
      rpm="./dotfiles/scripts/rofi-power-menu";
      stats="./dotfiles/scripts/sys-stats";
      wthr="./dotfiles/scripts/weather";
    };
  };
}
