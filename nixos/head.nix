{config, lib, pkgs, ...}: {

  hardware.opengl = {
    enable = true;
    driSupport = true;
  };

  security.polkit.enable =true;
  services.dbus.enable = true;
  fonts.enableDefaultFonts = true;

  #autologin and launch sway
  services.getty.autologinUser = "jacob";
  environment.loginShellInit = ''
    [[ "$(tty)" == /dev/tty1 ]] && Hyprland 
  '';

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  services.xserver.displayManager.lightdm.enable = false;
  services.xserver.displayManager.sddm.enable = false;
  services.xserver.displayManager.gdm.enable = false;

  programs.dconf.enable = true;

}
