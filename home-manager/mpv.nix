{config, lib, pkgs, ...}:
{

  programs.mpv = {
    enable = true;
    config = {
      gpu-context = "wayland";
    };
  };

}
