{ inputs, pkgs, config, lib, ...}: {

 imports = [
  ./hardware-laptop.nix
  ./head.nix
 ];

 hardware.opengl = {
  extraPackages = with pkgs; [
    intel-media-driver
    vaapiIntel
    vaapiVdpau
    libvdpau-va-gl
  ];
 };

 # Remove sound.enable or turn it off if you had it set previously, it seems to cause conflicts with pipewire
#sound.enable = false;
networking.hostName = "nixLaptop";

services.logind.lidSwitchExternalPower = "ignore";

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

 boot.kernelPackages = pkgs.linuxPackages_latest;

 #backlight 
 hardware.acpilight.enable = true;

 environment.shellAliases = {
    update = "nixos-rebuild --upgrade switch --flake .#nixLaptop";
 };
 
 environment.systemPackages = with pkgs; [
    intel-gpu-tools ntfs3g gnome-themes-extra
  ];
 }
