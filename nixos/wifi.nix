{ inputs, pkgs, ...}: {

  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
    wifi.macAddress = "random";
  };

}
