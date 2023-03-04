# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs,lib ,... }:

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

	zramSwap = {
		enable = true;
		memoryPercent = 200;
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
  i18n = {
  	inputMethod = {
      enabled = "fcitx5";
      #ibus.engines = with pkgs.ibus-engines; [rime hangul ];
      fcitx5.addons= with pkgs; [fcitx5-rime  ];
      fcitx5.enableRimeData = true;
    };
	  defaultLocale = "pt_BR.utf8";
	};

  xdg = {

    portal = {
      extraPortals = with pkgs; [ xdg-desktop-portal-wlr xdg-desktop-portal-gtk ];
      enable = true;
    };
  };

  # Configure console keymap
  programs = {
    xwayland.enable = true;
    git.enable = true;
    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # mtr.enable = true;
    # gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };
  };


  fonts= lib.mkForce {
    
    fontDir.enable = true;
      fonts=  with pkgs; [

    (nerdfonts.override {
      fonts = ["CodeNewRoman" "SpaceMono"];
    })
    source-han-mono
    twitter-color-emoji #Twitter Color Emoji
    symbola # tudo q é simbola de escritas exotivas
    ];
    fontconfig.defaultFonts.emoji = ["Twitter Color Emoji" ];
  };

  console.keyMap = "br-abnt2";
  # Enable sound with pipewire.

  sound.enable = true;
  hardware = {
    pulseaudio.enable = false;
    sane = {# scanner
      enable = true;
      extraBackends = [pkgs.sane-airscan ];

    };
  };
  security.rtkit.enable = true;

  services = {
    fwupd.enable = true;
    xserver = {
      enable = true;
      layout = "br";
      xkbVariant = "";
      displayManager = {
        sddm.enable = false;
        lightdm.enable = false;
        #startx.enable = true; 
        autoLogin.user = "dnl";
        };
      desktopManager = {
        plasma5 = {
          enable = true;
          };
        cinnamon.enable=true;
        lxqt.enable = true;
        mate.enable = true;
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };
      };
      windowManager.qtile.enable = true;
    };
    flatpak.enable = true;
    # Enable CUPS to print documents.
    printing = {
      
    enable = true;
    drivers = [pkgs.gutenprint];
    };
    avahi ={
      enable = true;
      openFirewall = true;
      nssmdns = true;
    };
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
      # $ sudo freshclam
      daemon.enable = false;
      updater.enable = false;
    };
    auto-cpufreq.enable = true;
    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    # openssh.enable = true;

    # Enable touchpad support (enabled default in most desktopManager).
    # xserver.libinput.enable = true;    
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dnl = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "dnl";
    extraGroups = ["scanner" "lp" "networkmanager" "wheel" ];
    packages = with pkgs; [ distrobox ];
  };
  nixpkgs.config.allowUnfree = true;

  # $ nix search wget
  environment = {
    #shells = [pkgs.fish];
    #variables = {
    #  EDITOR = "hx";
    #  VISUAL = "hx";
    #  SUDO_EDITOR = "hx";
    #};
    #defaultPackages = lib.mkForce [ pkgs.helix pkgs.strace];
    systemPackages = with pkgs; [
    #brise # rime schemes
    xfce.xfce4-dockbarx-plugin
    xfce.xfce4-whiskermenu-plugin
    kate
    xclip
    wl-clipboard
    steam-run
    libsForQt5.discover
    libsForQt5.krohnkite
    libsForQt5.bismuth
    libsForQt5.powerdevil
    libsForQt5.ark
    unp
    firefox-wayland
  ];
  };

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
