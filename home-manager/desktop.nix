{ pkgs, ...}: {

  home.packages = with pkgs; [
   darktable
   krita
   #spotify
   heroic
   openrgb
   gimp
   discord
   calibre

   (writeShellScriptBin "win10" ''
     virsh -c qemu:///system start win10 && looking-glass-client
   '')
  ];

  programs.looking-glass-client.enable = true;
  programs.looking-glass-client.package = pkgs.callPackage (import ./looking-glass.nix){};

  home.shellAliases = {
    windows = "virsh -c qemu:///system start win10 && looking-glass-client";
  };

  gtk = {
    enable = true;
    theme = {
      name = "rose-pine";
      package = pkgs.rose-pine-gtk-theme;
    };
  };


}
