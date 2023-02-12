{ pkgs, ...}: {

  home.packages = with pkgs; [
  jdk
  wmname
 ];

  gtk = {
    enable = true;
    theme = {
      name = "rose-pine";
      package = pkgs.rose-pine-gtk-theme;
    };
  };


}
