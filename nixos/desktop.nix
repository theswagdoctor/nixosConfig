{ inputs, pkgs, config, lib, ...}: {

 imports = [
  ./hardware-desktop.nix
  ./docker.nix
 ];

 hardware.opengl = {
  enable = true;
  driSupport = true;
 };

 #hostname
 networking.hostName = "nixDesktop";

 #docker
# virtualisation.docker = {
#  enable = true;
#  enableOnBoot = true;
#  rootless = {
#    enable = true;
#    setSocketVariable = true;
#  };
# };


 # Remove sound.enable or turn it off if you had it set previously, it seems to cause conflicts with pipewire
#sound.enable = false;

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

#virt manager
 programs.dconf.enable = true;
 virtualisation.libvirtd.enable = true;
 virtualisation.libvirtd.qemu.ovmf.enable = true;


 services.xserver.enable = true;

# hardware.opengl.extraPackages = with pkgs; [
#  amdvlk
#];
## For 32 bit applications 
## Only available on unstable
#hardware.opengl.extraPackages32 = with pkgs; [
#  driversi686Linux.amdvlk
#];

 services.xserver.displayManager.lightdm.enable = false;
 services.xserver.displayManager.sddm.enable = false;
 services.xserver.displayManager.gdm.enable = false;

 #steam 
 programs.steam.enable = true;

 #linux zen
 #boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

 #zfs
 boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
 services.zfs.autoScrub.enable = true;
 services.zfs.autoSnapshot.enable = true;
 boot.supportedFilesystems = ["zfs" "btrfs"];
 networking.hostId = (builtins.substring 0 8 (builtins.readFile "/etc/machine-id"));


 environment.shellAliases = {
  sudo = "doas ";
  update = "nixos-rebuild --upgrade switch --flake .#nixDesktop";
 };
 #doas stuff 
  security.sudo.enable = false;
  security.doas = {
    enable = true;
    extraRules = [{
      users = ["jacob"];
      keepEnv = true;
      persist = true;
    }];
  };
 
 environment.systemPackages = with pkgs; [
   #for vm
   OVMF 
   virt-manager
   #for proton-GE
   protonup-ng 

   ntfs3g 
   gnome-themes-extra
   #for openrgb
   i2c-tools

   glib
   usbutils
   radeontop
  ];

  #openrgb
  services.hardware.openrgb = {
    enable = true;
    motherboard = "amd";
  };
  #looking glass shm rules
  systemd.tmpfiles.rules = [
    "f /dev/shm/looking-glass 0660 jacob kvm -"
  ];
}
