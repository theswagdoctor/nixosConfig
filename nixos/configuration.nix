# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{ inputs, lib, config, pkgs, ... }: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
#    ./hardware-configuration.nix
    ./wifi.nix
#    ./desktop.nix
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
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  #: Add the rest of your current configuration

  networking.nameservers = ["10.10.10.11"];
  networking.hosts = {
    "10.10.10.11" = ["pi"];
    "10.10.10.10" = ["desktop"];
    "10.10.10.12" = ["laptop"];
  };

  users.motd = ''
    ACTIVATE LINUX
  Go to Settings to activate Linux
  '';
  security.pam.services.jacob.showMotd = true;
  security.pam.services.root.showMotd = true;

  # : This is just an example, be sure to use whatever bootloader you prefer

  # timezone
  time.timeZone = "US/Eastern";
  

  # : Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users = {
    #: Replace with your username
    jacob = {
      #: You can set an initial password for your user.
      # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
      # Be sure to change it (using passwd) after rebooting!
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        #: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      #: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
      extraGroups = [ "libvirtd" "wheel" "audio" "video" "networkmanager"];
    };
  };

  services.mullvad-vpn.enable = true;
  services.gvfs.enable = true;

  environment.shellAliases = {
    sudo = "doas ";
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

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      # Forbid root login through SSH.
      permitRootLogin = "no";
      # Use keys only. Remove if you want to SSH using password (not recommended)
      passwordAuthentication = false;
    };
  };

  environment.systemPackages = with pkgs; [
   bc traceroute nmap ntfs3g git efibootmgr lm_sensors psmisc sshfs tmux htop gptfdisk wget nethogs gotop iotop nnn pciutils 
  ];
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.11";
}