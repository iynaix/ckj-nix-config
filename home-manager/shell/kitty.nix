{ config, pkgs, lib, ... }:

{
  programs = {
    kitty = {
      enable = true;
      settings = {
        allow_remote_control = "yes";
        background_opacity = "0.50";
        confirm_os_window_close = 0;
        copy_on_select = "clipboard";
        dynamic_background_opacity = "yes";
        enable_audio_bell = false;
        font_features = "+zero";
        scrollback_lines = 10000;
        shell = "fish";
        tab_bar_edge = "top";
        update_check_interval = 0;
      };
    };
  };
}
