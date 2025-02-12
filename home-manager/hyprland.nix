_:

{
  wayland = {
    windowManager = {
      hyprland = {
        enable = true;
        systemdIntegration = true;
        extraConfig = ''
          # See https://wiki.hyprland.org/Configuring/Monitors/

          monitor=,preferred,auto,auto

          # Execute your favorite apps at launch

          exec-once=./.local/bin/random-wallpaper
          # exec-once=/usr/lib/polkit-kde-authentication-agent-1

          # exec-once = waybar & blueman-applet # & hyprpaper & firefox

          # Source a file (multi-file configs)

          # source = ~/.config/hypr/myColors.conf

          # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
          input {
            kb_layout = us
            follow_mouse = 1
            touchpad {
              natural_scroll = no
              tap-to-click = false
            }

            sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
          }

          general {
            # See https://wiki.hyprland.org/Configuring/Variables/ for more
            gaps_in = 3
            gaps_out = 5
            border_size = 2
            col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
            col.inactive_border = rgba(595959aa)

            layout = dwindle
          }

          decoration {
            # See https://wiki.hyprland.org/Configuring/Variables/ for more
            blur {
              enable = true
              rounding = 10
              blur = yes
              blur_size = 3
              blur_passes = 1
              blur_new_optimizations = on

              drop_shadow = yes
              shadow_range = 4
              shadow_render_power = 3
              col.shadow = rgba(1a1a1aee)
            }

            animations {
              enabled = yes
              # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

              bezier = myBezier, 0.05, 0.9, 0.1, 1.05

              animation = windows, 1, 7, myBezier
              animation = windowsOut, 1, 7, default, popin 80%
              animation = border, 1, 10, default
              animation = fade, 1, 7, default
              animation = workspaces, 1, 6, default
            }

            dwindle {
              # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
              pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
              preserve_split = yes # you probably want this
              no_gaps_when_only = true
            }

            master {
              # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
              new_is_master = true
              no_gaps_when_only = true
            }

            gestures {
              # See https://wiki.hyprland.org/Configuring/Variables/ for more
              workspace_swipe = on
              }

              # Example per-device config
              # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
              device:epic mouse V1 {
                sensitivity = -0.5
                }

                # Example windowrule v1
                # windowrule = float, ^(kitty)$

                windowrule = float, ^(blueman-manager)$
                windowrule = float, ^(pavucontrol)$
                windowrule = float, ^(Steam)$

                # windowrules to define workspace for programs

                windowrule = workspace 1, firefox
                windowrule = workspace 2, LibreWolf
                windowrule = workspace 3, libreoffice-base
                windowrule = workspace 3, libreoffice-calc
                windowrule = workspace 3, libreoffice-draw
                windowrule = workspace 3, libreoffice-impress
                windowrule = workspace 3, libreoffice-math
                windowrule = workspace 3, libreoffice-writer
                windowrule = workspace 3, soffice
                windowrule = workspace 4, Steam
                windowrule = workspace 5, zoom
                # windowrule = workspace 6,
                windowrule = workspace 7, thunar
                # windowrule = workspace 8,
                windowrule = workspace 9, rhythmbox
                windowrule = workspace 9, Spotify
                windowrule = workspace 9, strawberry
                windowrule = workspace 10, WebCord
                windowrule = workspace 11, parsecd
                # windowrule = workspace 12,

                # Example windowrule v2
                # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
                # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

                windowrulev2 = float,class:^(kitty)$,title:^(ranger)$

                # See https://wiki.hyprland.org/Configuring/Keywords/ for more
                $mainMod = SUPER
                # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
                bind = $mainMod, W, exec, firefox
                bind = $mainMod, M, exec, spotifywm
                bind = $mainMod, E, exec, librewolf
                bind = $mainMod, F, exec, kitty -e ranger
                bind = $mainMod, D, exec, webcord
                bind = $mainMod, L, exec, ./.local/bin/powermenu.sh
                bind = $mainMod, T, exec, ./.local/bin/time-date
                bind = $mainMod, C, exec, ./.local/bin/weather bind = $mainMod, S, exec, ./.local/bin/sys-stats
                bind = $mainMod, Return, exec, kitty
                bind =, Print, exec, grim -g "$(slurp)"
                bind = $mainMod, Q, killactive,
                bind = $mainMod, Escape, exit,
                bind = $mainMod SHIFT, F, exec, thunar
                bind = $mainMod, V, togglefloating,
                bind = $mainMod SHIFT, R, exec, dmenu-wl_run -b
                bind = $mainMod, R, exec, rofi -show drun -disable-history
                bind = $mainMod, P, pseudo, # dwindle
                bind = $mainMod, J, togglesplit, # dwindle

                # Move focus with mainMod + arrow keys
                bind = $mainMod, left, movefocus, l
                bind = $mainMod, right, movefocus, r
                bind = $mainMod, up, movefocus, u
                bind = $mainMod, down, movefocus, d

                # Switch workspaces with mainMod + [0-9]
                bind = $mainMod, 1, workspace, 1
                bind = $mainMod, 2, workspace, 2
                bind = $mainMod, 3, workspace, 3
                bind = $mainMod, 4, workspace, 4
                bind = $mainMod, 5, workspace, 5
                bind = $mainMod, 6, workspace, 6
                bind = $mainMod, 7, workspace, 7
                bind = $mainMod, 8, workspace, 8
                bind = $mainMod, 9, workspace, 9
                bind = $mainMod, 0, workspace, 10
                bind = $mainMod, minus, workspace, 11
                bind = $mainMod, equal, workspace, 12

                # Move active window to a workspace with mainMod + SHIFT + [0-9]
                bind = $mainMod SHIFT, 1, movetoworkspace, 1
                bind = $mainMod SHIFT, 2, movetoworkspace, 2
                bind = $mainMod SHIFT, 3, movetoworkspace, 3
                bind = $mainMod SHIFT, 4, movetoworkspace, 4
                bind = $mainMod SHIFT, 5, movetoworkspace, 5
                bind = $mainMod SHIFT, 6, movetoworkspace, 6
                bind = $mainMod SHIFT, 7, movetoworkspace, 7
                bind = $mainMod SHIFT, 8, movetoworkspace, 8
                bind = $mainMod SHIFT, 9, movetoworkspace, 9
                bind = $mainMod SHIFT, 0, movetoworkspace, 10
                bind = $mainMod SHIFT, minus, movetoworkspace, 11
                bind = $mainMod SHIFT, equal, movetoworkspace, 12

                # Scroll through existing workspaces with mainMod + scroll
                bind = $mainMod, mouse_down, workspace, e+1
                bind = $mainMod, mouse_up, workspace, e-1

                # Move/resize windows with mainMod + LMB/RMB and dragging
                bindm = $mainMod, mouse:272, movewindow
                bindm = $mainMod, mouse:273, resizewindow

                # Function Keys & Scripts

                bind=, XF86AudioMute, exec, ./.local/bin/vol-mute                #Fn+F1
                binde=, XF86AudioLowerVolume, exec, ./.local/bin/vol-down        #Fn+F2
                binde=, XF86AudioRaiseVolume, exec, ./.local/bin/vol-up          #Fn+F3
                bind=, XF86AudioMicMute, exec, ./.local/bin/audio-mic-mute       #Fn+F4
                binde=, XF86MonBrightnessDown, exec, ./.local/bin/brightness-down #Fn+F11
                binde=, XF86MonBrightnessUp, exec, ./.local/bin/brightness-up     #Fn+F12
                bind= ALT, S, exec, brightness-sleep       #Goodnight
                bind= ALT, W, exec, brightness-wakeup      #Wakeup
        '';
      };
    };
  };
}
