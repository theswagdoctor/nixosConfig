{ inputs, pkgs, config, lib, ...}: {

 imports = [
  ./foot.nix
  ./waybar.nix
 ];

 programs.foot.enable = true;
 programs.waybar.enable = true;
 home.packages = with pkgs; [
 font-awesome swayidle swaybg wlsunset wl-clipboard mako rofi-wayland wev 
 ];

home.sessionVariables = {
  MOZ_ENABLE_WAYLAND = 1;
#  XDG_CURRENT_DESKTOP = "sway"; 
  TERMINAL = "foot";
};

  wayland.windowManager.hyprland = {
    enable = true;   
    extraConfig = (import ./hyprconf.nix{});
  };

}
