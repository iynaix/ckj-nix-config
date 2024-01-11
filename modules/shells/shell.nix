# create a cross shell config
{
  config,
  host,
  lib,
  pkgs,
  ...
}: {
  home.shellAliases =
    {
      ":e" = "nvim";
      ":q" = "exit";
      c = "clear";
      cat = "bat";
      crate = "cargo";
      btop = "btop --preset 0";
      isodate = ''date - u + "%Y-%m-%dT%H:%M:%SZ"'';
      man = "${pkgs.bat-extras.batman}/bin/batman";
      mkdir = "mkdir -p";
      mount = "mount --mkdir";
      nano = "nvim";
      open = "xdg-open";
      pj = "openproj";
      py = "python";
      t = "eza --tree --level=3";
      v = "nvim";
      wget = "wget --content-disposition";
      coinfc = "openproj coinfc";

      # cd aliases
      ".." = "cd ..";
      "..." = "cd ../..";
    }
    //
    # add shortcuts for quick cd in shell
    lib.mapAttrs (_: value: "cd ${value}") config.iynaix.shortcuts;

    };
}
