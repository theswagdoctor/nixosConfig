{ inputs, pkgs, ...}: {

  programs.waybar.package = pkgs.waybar.overrideAttrs (oa: {
    mesonFlags = (oa.mesonFlags or  [ ]) ++ [ "-Dexperimental=true" ];
            postPatch = ''
          # use hyprctl to switch workspaces
          sed -i 's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());/g' src/modules/wlr/workspace_manager.cpp
        '';
  });
  programs.waybar.enable = true;
#  programs.waybar.settings = {
#    mainBar = {
#     height = 22;
#     modules-left = ["sway/workspaces" "sway/mode" "custom/media"];
#     modules-center = ["sway/window"];
#     modules-right= ["idle_inhibitor" "pulseaudio" "network" "cpu" "memory" "temperature" "backlight" "battery" "battery#bat2" "clock" "tray"];
#    };
#  }; 
  programs.waybar.style = ''

    
* {
    border: none;
    border-radius: 0;
    font-family: Cartograph CF Nerd Font, monospace;
    font-weight: bold;
    font-size: 14px;
    min-height: 0;
}

window#waybar {
    background: rgba(21, 18, 27, 0);
    color: #cdd6f4;
}

tooltip {
    background: #1e1e2e;
    border-radius: 10px;
    border-width: 2px;
    border-style: solid;
    border-color: #11111b;
}

#workspaces button {
    padding: 5px;
    color: #313244;
    margin-right: 5px;
}

#workspaces button.active {
    color: #a6adc8;
}

#workspaces button.focused {
    color: #a6adc8;
    background: #eba0ac;
    border-radius: 10px;
}

#workspaces button.urgent {
    color: #11111b;
    background: #a6e3a1;
    border-radius: 10px;
}

#workspaces button:hover {
    background: #11111b;
    color: #cdd6f4;
    border-radius: 10px;
}

#custom-language,
#custom-updates,
#custom-caffeine,
#custom-weather,
#window,
#clock,
#battery,
#pulseaudio,
#network,
#workspaces,
#tray,
#backlight {
    background: #1e1e2e;
    padding: 0px 10px;
    margin: 3px 0px;
    margin-top: 10px;
    border: 1px solid #181825;
}

#tray {
    border-radius: 10px;
    margin-right: 10px;
}

#workspaces {
    background: #1e1e2e;
    border-radius: 10px;
    margin-left: 10px;
    padding-right: 0px;
    padding-left: 5px;
}

#custom-caffeine {
    color: #89dceb;
    border-radius: 10px 0px 0px 10px;
    border-right: 0px;
    margin-left: 10px;
}

#custom-language {
    color: #f38ba8;
    border-left: 0px;
    border-right: 0px;
}

#custom-updates {
    color: #f5c2e7;
    border-left: 0px;
    border-right: 0px;
}

#window {
    border-radius: 10px;
    margin-left: 60px;
    margin-right: 60px;
}

#clock {
    color: #fab387;
    border-radius: 10px 0px 0px 10px;
    margin-left: 0px;
    border-right: 0px;
}

#network {
    color: #f9e2af;
    border-left: 0px;
    border-right: 0px;
}

#pulseaudio {
    color: #89b4fa;
    border-left: 0px;
    border-right: 0px;
}

#pulseaudio.microphone {
    color: #cba6f7;
    border-left: 0px;
    border-right: 0px;
}

#battery {
    color: #a6e3a1;
    border-radius: 0 10px 10px 0;
    margin-right: 10px;
    border-left: 0px;
}

#custom-weather {
    border-radius: 0px 10px 10px 0px;
    border-right: 0px;
    margin-left: 0px;
}

  '';

}