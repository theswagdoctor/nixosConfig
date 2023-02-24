{ inputs, pkgs, config, lib, ...}: {

 imports = [
  ./hardware-laptop.nix
 ];

 hardware.opengl = {
  enable = true;
  driSupport = true;
 };

 # Remove sound.enable or turn it off if you had it set previously, it seems to cause conflicts with pipewire
#sound.enable = false;
networking.hostName = "nixLaptop";

# rtkit is optional but recommended
security.rtkit.enable = true;
services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
  # If you want to use JACK applications, uncomment this
  #jack.enable = true;
};

 security.polkit.enable =true;
 services.dbus.enable = true;
 fonts.enableDefaultFonts = true;

 #autologin and launch sway
 services.getty.autologinUser = "jacob";
 environment.loginShellInit = ''
    [[ "$(tty)" == /dev/tty1 ]] && Hyprland 
  '';

 programs.dconf.enable = true;

boot.loader = {
   efi = {
 #     canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
   };
   grub = {
      efiSupport = true;
      efiInstallAsRemovable = true;
      device = "/dev/disk/by-id/usb-SanDisk_Ultra_Fit_4C530001270602106512-0:0";     
   };
};

 services.xserver.enable = true;

 services.xserver.displayManager.lightdm.enable = false;
 services.xserver.displayManager.sddm.enable = false;
 services.xserver.displayManager.gdm.enable = false;

 boot.kernelPackages = pkgs.linuxPackages_latest;

 #backlight 
 hardware.acpilight.enable = true;

 environment.shellAliases = {
    update = "nixos-rebuild --upgrade switch --flake .#nixLaptop";
 };
 
 environment.systemPackages = [
     pkgs.ntfs3g pkgs.gnome-themes-extra
  ];
 }
