# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  boot.loader = {
    # Bootloader.
    systemd-boot.enable = true;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
  };

  networking = {
    firewall = {
      # Open ports in the firewall.
      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
      # Or disable the firewall altogether.
      enable = false;
    };
    hostName = "nixos"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "pt_BR.utf8";

  xdg = {

    portal = {
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      enable = true;
    };
  };

  # Configure console keymap
  programs = {
    xwayland.enable = false;
    git.enable = true;
    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # mtr.enable = true;
    # gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };
  };
  console.keyMap = "br-abnt2";
  # Enable sound with pipewire.

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services = {
    fwupd.enable = true;
    xserver = {
      enable = true;
      layout = "br";
      xkbVariant = "";
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
      windowManager.qtile.enable = true;
    };
    flatpak.enable = true;
    # Enable CUPS to print documents.
    printing.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
    clamav = {
      daemon.enable = true;
      updater.enable = true;
    };
    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    # openssh.enable = true;

    # Enable touchpad support (enabled default in most desktopManager).
    # xserver.libinput.enable = true;    
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dnl = {
    isNormalUser = true;
    description = "dnl";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ neovim distrobox ];
  };
  nixpkgs.config.allowUnfree = true;

  # $ nix search wget
  environment.systemPackages = with pkgs; [
    kate
    wget
    helix
    xclip
    wl-clipboard
    nixfmt
    steam-run
    libsForQt5.discover
    libsForQt5.krohnkite
    libsForQt5.bismuth
    libsForQt5.powerdevil
    libsForQt5.ark
    unp
  ];

  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.dnsname.enable = true;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
