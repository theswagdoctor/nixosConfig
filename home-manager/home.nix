# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, lib, config, pkgs, ... }: 

{
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ./firefox.nix
#    ./sway.nix
    ./hyprland.nix
    ./nvim.nix
    ./newsboat.nix
#    ./color.nix
#   ./desktop.nix
    ./mpv.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
      (self: super: {
        discord = super.discord.overrideAttrs (
          _: { src = builtins.fetchTarball {
            url = "https://discord.com/api/download?platform=linux&format=tar.gz";
            sha256 = "087p8z538cyfa9phd4nvzjrvx4s9952jz1azb2k8g6pggh1vxwm8";
          };}
        );
      })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "jacob";
    homeDirectory = "/home/jacob";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [ 
    lmms
    streamlink
    mpv
    imv
    qbittorrent
    pulsemixer 
    nicotine-plus
    aria2
    cava
    spotify
    #pcmanfm
    pcmanfm
    gvfs
    #fonts
#    noto-fonts
    noto-fonts-extra
    noto-fonts-emoji
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    nerdfonts

    unzip
    tldr
    trash-cli
    weechat
    zathura

    nitch 
    yt-dlp

    baobab
  ];

  fonts.fontconfig.enable = true;
  home.sessionVariables = {
    NNN_TRASH = "trash-cli";
    NNN_OPTS="C";
    NNN_COLORS="3124";
  };

  programs.bash.enable = true;
  programs.bash.shellAliases = {
    imv = "imv-dir";
  };
  programs.bash.initExtra = ''
      source "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
    '';

 # programs.autojump.enable = true;
 # programs.autojump.enableBashIntegration = true;

  # Enable home-manager and git
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Hello, this is my username";
    userEmail = "124476172+theswagdoctor@users.noreply.github.com";

  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";

  #.config config (copy file method)
  #xdg.configFile."streamlink/config".source = ./config/streamlink/config;
  home.file.".config/" = {
    source = ./config;
    recursive = true;
  };

  #.config config (create file method)
  home.file = {
    ".config/streamlink/config".text = ''
      player=mpv --no-video
      default-stream=audio_only
    '';
  };
}
