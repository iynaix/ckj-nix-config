import os
import re
import socket
import subprocess
from libqtile import hook
from libqtile import qtile
from typing import List  
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.widget import Spacer, Backlight
from libqtile.widget.image import Image
from libqtile.dgroups import simple_key_binder

import colors

#Variables
mod = "mod4"
mod1 = "mod1"
browser = 'firefox'
email_browser = 'librewolf'
terminal = 'alacritty'
text_editor = f"{terminal} -e nvim"
file_manager1 = 'thunar'
file_manager2 = f"{terminal} -e ranger"
file_launcher1 = 'rofi -show run'
file_launcher2 = 'dmenu_run'
email_client = 'thunderbird'
process_viewer = f"{terminal} -e btop"
configuration_menu = '.local/bin/rofi_configuration_menu'
website_menu = '.local/bin/rofi_website_menu'
colorscheme_menu = '.local/bin/rofi_colorscheme_menu'

mbfs = colors.mbfs()
doomOne = colors.doomOne()
dracula = colors.dracula()
everforest = colors.everforest()
nord = colors.nord()
gruvbox = colors.gruvbox()

#Choose colorscheme
colorscheme = dracula

#Colorschme funcstion
colors, backgroundColor, foregroundColor, workspaceColor, foregroundColorTwo = colorscheme 


#KEYBINDINGS

keys = [

        # Applications

        # Open Terminal
        Key([mod], "Return", lazy.spawn(terminal), desc="Launch Terminal"),
        
        # Launch Browser
        Key([mod], "w", lazy.spawn(browser), desc="Launch Browser"),
        
        # Open Rofi
        Key([mod], "r", lazy.spawn("rofi -disable-history -show drun"), desc="Spawn Rofi"),
        
        # Launch Prompt
        Key([mod, "shift"], "r", lazy.spawncmd(), desc="Spawn Prompt Widget"),
        
        #Text editor
        Key([mod, "shift"], "n", lazy.spawn(text_editor), desc = "Launch Neovim"),

        # Email Client
        Key([mod], "e", lazy.spawn(email_client), desc = "Launch thunderbird"),

        #File manager
        Key([mod, "shift"], "f", lazy.spawn(file_manager1), desc = "Lauch primary file manager"),

        # Grow Windows, If Current Window is on the Edge of Screen and Direction will be to Screen Edge - Window will Shrink.
        
        Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
        Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
        Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
        Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
        Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

        # Move Current Window Left/Right in Columns or Up/Down in Stacks

        Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
        Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
        Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
        Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

        #Rofi Bash scripts

        Key([mod], "d", lazy.spawn(file_launcher2), desc = "Launch secondary launcher"),
        Key([mod, "control"], "c", lazy.spawn(configuration_menu), desc = "Launch rofi configuration menu"),
        Key([mod, "control"], "b", lazy.spawn(website_menu), desc = "Launch rofi website menu"),
        Key([mod, "control"], "t", lazy.spawn(colorscheme_menu), desc = "Launch rofi colorscheme menu"),

        # Reload/Shutdown Qtile

        Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
        Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

        # Switch Focus Between Windows
        
        Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
        Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
        Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
        Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
        Key([mod], "n", lazy.layout.next(), desc="Move window focus to other window"),

        # Take Screenshot

        Key([], "Print", lazy.spawn("flameshot gui")),
        
        # Toggle between different layouts as defined below

        Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
        Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
        Key([mod, "shift", "control"], "h", lazy.window.swap_column_left()),
        Key([mod, "shift", "control"], "l", lazy.window.swap_column_right()),
        Key([mod, "shift"], "space", lazy.layout.flip()),

        # Toggle between split and unsplit sides of stack.
            # Split = all windows displayed
            # Unsplit = 1 window displayed, like Max layout, but still with multiple stack panes

        Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),

        # Volume Controls

        Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer set Master 2%+")),
        Key([], "XF86AudioLowerVolume", lazy.spawn("amixer set Master 2%-")),
        Key([], "XF86AudioMute", lazy.spawn("amixer set Master toggle")),
        ]

groups = [Group("", layout='bsp', matches=[Match(wm_class="firefox")]),
          Group("", layout='bsp', matches=[Match(wm_class="librewolf-default")]),
          Group("󰬱", layout='bsp', matches=[Match(wm_class="Soffice")]),
          Group("󰓓", layout='bsp', matches=[Match(wm_class="Steam")]),
          Group("", layout='bsp', matches=[Match(wm_class="zoom")]),
          Group("", layout='bsp', matches=[Match(wm_class="thunar")]),
          Group("", layout='bsp', matches=[Match(wm_class="strawberry")]),
          Group("", layout='bsp', matches=[Match(wm_class="Spotify")]),
          Group("󰙯", layout='bsp', matches=[Match(wm_class="discord")]),
          Group("", layout='bsp', matches=[Match(wm_class="parsecd")])]

dgroups_key_binder = simple_key_binder(mod)

# Append scratchpad with dropdowns to groups
groups.append(ScratchPad('scratchpad', [
    DropDown('terminal', terminal, width=0.8, height=0.8, x=0.1, y=0.1, opacity=0.9),
    DropDown('text_editor', text_editor, width=0.8, height=0.8, x=0.1, y=0.1, opacity=0.9),
    DropDown('file_manager2', file_manager2, width=0.8, height=0.8, x=0.1, y=0.1, opacity=0.9),
    DropDown('process_viewer', process_viewer, width=0.8, height=0.8, x=0.1, y=0.1, opacity=0.9),
]))
# extend keys list with keybinding for scratchpad
keys.extend([
    Key(["control"], "1", lazy.group['scratchpad'].dropdown_toggle('terminal')),
    Key(["control"], "2", lazy.group['scratchpad'].dropdown_toggle('text_editor')),
    Key(["control"], "3", lazy.group['scratchpad'].dropdown_toggle('file_manager2')),
    Key(["control"], "4", lazy.group['scratchpad'].dropdown_toggle('process_viewer')),
])

layouts = [
        layout.Columns(border_focus = colors[0], border_normal = colors[0], border_width = 1, margin = 8),
        # layout.Bsp(border_focus = colors[4], margin = 5),
        # layout.Matrix(),
        # layout.MonadTall(),
        # layout.MonadWide(),
        # layout.RatioTile(border_focus = colors[4], margin = 2),
        # layout.Tile(border_focus = colors[4], margin = 2),
        # layout.TreeTab(border_focus = colors[4], margin = 2),
        # layout.VerticalTile(),
        # layout.Zoomy(),
        ]

floating_layout = layout.Floating(
        float_rules=[

            # Run the utility of `xprop` to see the wm class and name of an X client.

            *layout.Floating.default_float_rules,
            Match(wm_class="blueman-manager"),  # Blueman - Bluetooth Manager
            Match(wm_class="confirmreset"),  # gitk
            Match(wm_class="makebranch"),  # gitk
            Match(wm_class="maketag"),  # gitk
            Match(wm_class="ssh-askpass"),  # ssh-askpass
            Match(title="branchdialog"),  # gitk
            Match(title="pinentry"),  # GPG key password entry
            ]
        )

widget_defaults = dict(
    font = 'Hack',
    fontsize = 14,
    padding = 2,
    background = colors[0]
)
extension_defaults = widget_defaults.copy()

screens = [
        Screen(
            top = bar.Bar(
                [
                    widget.Image(
                        filename = '~/.config/qtile/icons/fedora.png',
                        scale = True,
                        margin_x = 8,
                        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(file_launcher2)}
                        ),
                    widget.GroupBox(
                        padding = 4,
                        active = colors[2],
                        inactive = colors[1],
                        highlight_color = [backgroundColor, workspaceColor],
                        highlight_method = 'line',
                        use_mouse_wheel = True,
                        ),
                    widget.Prompt(),
                    widget.TextBox(
                        text='\u25e2',
                        padding = 0,
                        fontsize = 50,
                        background = backgroundColor,
                        foreground = workspaceColor),
                    widget.WindowName(
                        background = workspaceColor,
                        ),
                    widget.Chord(
                        chords_colors = {
                            'launch': (foregroundColor, foregroundColor),
                            },
                        name_transform=lambda name: name.upper(),
                        ),
                    widget.TextBox(
                        text='\u25e2',
                        padding = 0,
                        fontsize = 50,
                        background = workspaceColor,
                        foreground = backgroundColor
                        ),
                    widget.TextBox(
                        text='\u25e2',
                        padding = 0,
                        fontsize = 50,
                        background = backgroundColor,
                        foreground = foregroundColorTwo
                        ),
                    widget.TextBox(
                        text='\u25e2',
                        padding = 0,
                        fontsize = 14,
                        background = foregroundColorTwo,
                        foreground = foregroundColorTwo
                        ),
#                    widget.Net(
#                            format = '📈 {down} ⬇️⬆️ {up}',
#                            foreground = colors[7],
#                            background = foregroundColorTwo,
#                            padding = 8,
#                            use_bits = True
#                            ),
#                    widget.CPU(
#                            format = '💻  {freq_current}GHz {load_percent}%',
#                            background = foregroundColorTwo,
#                            mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e btop')},
#                            foreground = colors[10],
#                            padding = 8
#                            ),
#                    widget.Memory(
#                            background = foregroundColorTwo,
#                            foreground = colors[4],
#                            measure_mem = 'G',
#                            format = '🐏 {MemUsed: .2f}{mm}/{MemTotal: .0f}{mm}',
#                            padding = 8
#                            ),
                    widget.CheckUpdates(
                            update_interval = 3600,
                            distro = "Fedora",
                            display_format = "📥  Updates: {updates} ",
                            # no_update_string = "📥  No Updates",
                            no_update_string = "",
                            mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e sudo dnf -y upgrade --refresh && flatpak update -y')},
                            colour_have_updates = colors[9],
                            colour_no_updates = colors[5],
                            padding = 8,
                            background = foregroundColorTwo
                            ),
                    widget.TextBox(
                            text = '📧',
                            padding = 8,
                            background = foregroundColorTwo,
                            mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(email_browser)}
                            ),
                    widget.Volume(
                            emoji = True,
                            background = foregroundColorTwo,
                            ),
                    widget.Volume(
                            foreground = colors[8],
                            background = foregroundColorTwo,
                            fmt = '{}'
                            ),
                    widget.TextBox(
                            text = '🔋',
                            background = foregroundColorTwo
                            ),
                    widget.Battery(
                            charge_char ='',
                            discharge_char = '',
                            full_char = '🔌',
                            update_interval = 60,
                            format = '{char} {percent:2.0%}',
                            foreground = colors[6],
                            background = foregroundColorTwo,
                            ),
                    widget.TextBox(
                            text='\u25e2',
                            padding = 0,
                            fontsize = 50,
                            background = foregroundColorTwo,
                            foreground = backgroundColor
                            ),
                    widget.Systray(
                            padding = 8
                            ),
                    widget.Clock(format='🗓️ %a, %D | ⏰ %l:%M %p',
                                 foreground = colors[2],
                                 background = backgroundColor,
                                 padding = 8
                                 ),
                    widget.QuickExit(
                            fmt = '⏻ ',
                            foreground = colors[9],
                            padding = 8
                            ),
                    ],
                    20,
                    ),
                    ),
                    ]

# Drag floating layouts.

mouse = [
        Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
        Click([mod], "Button2", lazy.window.bring_to_front()),
        Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
        ]

#dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

#Programms to start on log in
@hook.subscribe.startup_once
def autostart ():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

