{host, ...}:

{
  environment = {
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
      home="v ~/dotfiles/hosts/${host}/home.nix"; # Open home.nix file
      nc="v ~/dotfiles/hosts/${host}/configuration.nix"; # Open configuration.nix file
      ncg="nix-collect-garbage -d"; # Collect Garbage
      nrb="cd ~/dotfiles; sudo nixos-rebuild boot --flake .#${host}"; # Run 'nixos-rebuild boot'
      nrs="nh os switch --nom --hostname ${host}"; # Run 'nixos-rebuild switch' using nh
      # Scripts
      ko="./dotfiles/scripts/kitty_opacity";
      pow="./dotfiles/scripts/powermenu.sh";
      rpm="./dotfiles/scripts/rofi-power-menu";
      stats="./dotfiles/scripts/sys-stats";
      wthr="./dotfiles/scripts/weather";
    };
  };
}
