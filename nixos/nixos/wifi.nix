{ inputs, pkgs, ...}: {

  networking.networkmanager = {
    enable = true;
    insertNameservers = ["8.8.8.8" "8.8.4.4"];
    wifi.backend = "iwd";
    wifi.macAddress = "random";
  };

}
