{ inputs, pkgs, config, lib, ...}: {

 imports = [
  ./hardware-desktop.nix
#  ./docker.nix
  ./head.nix
  ../modules/passthrough.nix
 ];

 hardware.opengl = {
  enable = true;
  driSupport = true;
 };

 #hostname
 networking.hostName = "nixDesktop";

#virt manager
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

 #steam 
 programs.steam.enable = true;

 #linux zen
 #boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  vfio.enable = true;

 #zfs
 boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
 services.zfs.autoScrub.enable = true;
 services.zfs.autoSnapshot.enable = true;
 boot.supportedFilesystems = ["zfs" "btrfs"];
 networking.hostId = (builtins.substring 0 8 (builtins.readFile "/etc/machine-id"));

 environment.shellAliases = {
  update = "nixos-rebuild --upgrade switch --flake .#nixDesktop";
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
