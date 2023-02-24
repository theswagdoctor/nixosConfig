{ inputs, pkgs, config, lib, ...}: {

 imports = [
  ./foot.nix
  ./waybar.nix
 ];

 home.packages = with pkgs; [
  font-awesome swayidle swaybg wlsunset wl-clipboard mako wev 
 ];

home.sessionVariables = {
  MOZ_ENABLE_WAYLAND = 1;
  XDG_CURRENT_DESKTOP = "sway"; 
};

 wayland.windowManager.sway = {
  enable = true;
  xwayland = true;
  config = {
   bars = [{
     command = "waybar";
      position = "top";
    }];
   startup = [
    {command = "swaybg -i /home/jacob/test.jpg";}
    {command = "swayidle -w timeout 300 'swaymsg \"output * dpms off\"' resume 'swaymsg \"output * dpms on\"'";}
    {command = "wlsunset -l 44 -L -70 -t 4000";}
   ];
   menu = "rofi -show run";
   terminal = "foot";
   modifier = "Mod4";
   gaps.inner = 8;
   input = {
    "type:touchpad" = {
      dwt = "enabled";
        tap = "enabled";
        tap_button_map = "lrm";  
        middle_emulation = "enabled";        
        scroll_factor = "0.3";	
        pointer_accel = "0.3";	
        accel_profile = "adaptive";    
      };
   };
   window.commands = [{
     command = "fullscreen enable";
     criteria = {
      app_id = "looking-glass-client";
     }; 
   }];
   keybindings = 
    let
      modifier =  config.wayland.windowManager.sway.config.modifier;
      terminal = config.wayland.windowManager.sway.config.terminal;
    in lib.mkOptionDefault {
      "XF86AudioRaiseVolume" = "exec pulsemixer --unmute && pulsemixer --change-volume +5";
      "XF86AudioLowerVolume" = "exec pulsemixer --unmute && pulsemixer --change-volume -5";
      "XF86AudioMute" = "exec pulsemixer --togle-mute";
      "XF86MonBrightnessUp" = "exec xbacklight +5";
      "XF86MonBrightnessDown" = "exec xbacklight -5";
      "XF86PowerOff" = "exec wlogout";
      "${modifier}+Shift+f" = "exec firefox";
      "${modifier}+Shift+c" = "kill";
      "${modifier}+Shift+r" = "reload";
      #foot guake thing attemp
      "grave" = "exec foot swaymsg floating toggle";
      };
   
  };
 }; 

 programs.foot.enable = true;
 programs.waybar.enable = true;
 
}
