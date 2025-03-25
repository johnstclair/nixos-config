{ userSettings, lib, ... } : {
  wayland.windowManager.hyprland.settings = lib.mkForce {
    bind = [
      # show keybinds list
      "$mainMod, F1, exec, show-keybinds"

      # keybindings
      "$mainMod, Return, exec, ${userSettings.term}"
      "$mainMod, R, exec, pkill waybar; waybar"
      "$mainMod, C, exec, hyprpicker -a"
      "$mainMod, T, exec, swaync-client --toggle-panel"
      "$mainMod, W, killactive,"
      "$mainMod, F, fullscreen, 0"
      "$mainMod, M, exit,"
      "$mainMod, Space, togglefloating,"
      "$mainMod, O, exec, swaylock"
      "$mainMod, D, exec, ${userSettings.term} --class=launcher.launcher.launcher --title=launcher -e ~/.config/sway-launcher-desktop/launch.sh"
      "$mainMod, P, pseudo,"

      # screenshot
      "$mainMod SHIFT $notMainMod, S, exec, grimblast --notify --freeze save area ~/Pictures/$(date +'%Y-%m-%d-At-%Ih%Mm%Ss').png"
      "$mainMod SHIFT, S, exec, grimblast --notify --freeze copy area"

      # switch focus
      "$mainMod, h, movefocus, l"
      "$mainMod, left, movefocus, l"
      "$mainMod, l, movefocus, r"
      "$mainMod, right, movefocus, r"
      "$mainMod, k, movefocus, u"
      "$mainMod, up, movefocus, u"
      "$mainMod, j, movefocus, d"
      "$mainMod, down, movefocus, d"

      # switch workspace
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      "$mainMod, Tab, workspace, m+1"
      "SHIFT $mainMod, Tab, workspace, m-1"

      # same as above, but switch to the workspace
      "$mainMod SHIFT, 1, movetoworkspacesilent, 1" # movetoworkspacesilent
      "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
      "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
      "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
      "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
      "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
      "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
      "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
      "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
      "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
      "$mainMod CTRL, c, movetoworkspace, empty"

      # window control
      "$mainMod SHIFT, h, movewindow, l"
      "$mainMod SHIFT, left, movewindow, l"
      "$mainMod SHIFT, l, movewindow, r"
      "$mainMod SHIFT, right, movewindow, r"
      "$mainMod SHIFT, k, movewindow, u"
      "$mainMod SHIFT, up, movewindow, u"
      "$mainMod SHIFT, j, movewindow, d"
      "$mainMod SHIFT, down, movewindow, d"
      "$mainMod CTRL, h, resizeactive, -80 0"
      "$mainMod CTRL, left, resizeactive, -80 0"
      "$mainMod CTRL, l, resizeactive, 80 0"
      "$mainMod CTRL, right, resizeactive, 80 0"
      "$mainMod CTRL, k, resizeactive, 0 -80"
      "$mainMod CTRL, up, resizeactive, 0 -80"
      "$mainMod CTRL, j, resizeactive, 0 80"
      "$mainMod CTRL, down, resizeactive, 0 80"
      "$mainMod $notMainMod, h, moveactive,  -80 0"
      "$mainMod $notMainMod, left, moveactive,  -80 0"
      "$mainMod $notMainMod, l, moveactive, 80 0"
      "$mainMod $notMainMod, right, moveactive, 80 0"
      "$mainMod $notMainMod, k, moveactive, 0 -80"
      "$mainMod $notMainMod, up, moveactive, 0 -80"
      "$mainMod $notMainMod, j, moveactive, 0 80"
      "$mainMod $notMainMod, down, moveactive, 0 80"

      # clipboard manager
      "$mainMod, V, exec, cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"
    ];
    bindle = [
      # media
      ", XF86AudioRaiseVolume, exec, pulsemixer --change-volume +5"
      ", XF86AudioLowerVolume, exec, pulsemixer --change-volume -5"
    ];

    bindl = [
      # media
      ", XF86AudioMute, exec, pulsemixer --toggle-mute"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"
    ];
  };
}
