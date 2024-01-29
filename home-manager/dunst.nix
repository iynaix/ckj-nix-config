{config, ...}:

{
  services = {
    dunst = {
      enable = true;
      settings = {
        global = {
          follow = "mouse";
          notification_limit = "0";
          transparency = "15";
          separator_height = "1";
          horizontal_padding = "10";
          frame_width = "0";
          frame_color = "#282A36";
          font = "Monospace 10";
          format = "%s %p\n%b";
          min_icon_size = "0";
          max_icon_size = "64";
          browser = "";
        };
        urgency_low = {
          background = "#282a36";
          foreground = "#6272a4";
          timeout = 10;
        };
        urgency_normal = {
          background = "#282a36";
          foreground = "#FFFFFF"; #bd93f9
          timeout = 10;
        };
        urgency_critical = {
          background = "#ff5555";
          foreground = "#f8f8f2";
          frame_color = "#ff5555";
          timeout = 0;
        };
      };
    };
  };
}
