# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs,lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
     # <nixpkgs/nixos/modules/virtualisation/qemu-vm.nix> #tpm
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  hardware.i2c.enable= true;



  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
    magicOrExtension = ''\x7fELF....AI\x02'';
  };

  # # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };


  # systemd.services.NetworkManager-wait-online = {
    # enable=false;
    # serviceConfig = {
    #   ExecStart = [ "" "${pkgs.networkmanager}/bin/nm-online -q" ];
    # };
  # };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Enable swap on luks
  # boot.initrd.luks.devices."luks-f2c35767-a383-4e3e-8473-34be359147ff".device =
  #  "/dev/disk/by-uuid/f2c35767-a383-4e3e-8473-34be359147ff";
  # boot.initrd.luks.devices."luks-f2c35767-a383-4e3e-8473-34be359147ff".keyFile =
  #  "/crypto_keyfile.bin";
  hardware = {
    new-lg4ff.enable = true; #maybe g305 evdev detect

    logitech.wireless = {
      enableGraphical= true; # unifying receiver
      enable = true;# unifying receiver
    };
    bluetooth = {
      enable = true;
      
    };
  };
  boot.supportedFilesystems = ["ntfs"];
    # boot.plymouth = {
    # enable = true;
    # theme = "breeze";
    # themePackages = with pkgs; [ libsForQt5.breeze-plymouth ];
  # };

  zramSwap = {
    enable = true;
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
      fcitx5.addons = with pkgs; [ fcitx5-rime ];
    };
    defaultLocale = "pt_BR.utf8";
  };

  xdg = {

    portal = {
      wlr.enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
      enable = true;
    };
  };

  # Configure console keymap
  programs = {
    fish.enable = true;
    xwayland.enable = true;
    sway.enable = false;
    dconf.enable=true;
    nano.enable=false;
    virt-manager.enable=true;
    droidcam.enable=true;
    corectrl = {
      enable= true;
      gpuOverclock= {
        enable=true;
        ppfeaturemask = "0xffffffff";
      };

    };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # mtr.enable = true;
  # gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  };

  fonts = {
    enableDefaultPackages= lib.mkForce false;# true -> error
    fontDir.enable = true;# flatpak font user 
    # $ flatpak --user override --filesystem=$HOME/.local/share/fonts
    # $ flatpak --user override --filesystem=$HOME/.icons    

    packages= [
      (pkgs.nerdfonts.override { fonts = [ "CodeNewRoman" "SpaceMono" ]; })
      pkgs.source-han-sans#-vf-ttf
      pkgs.source-han-serif
      # pkgs.i-dot-ming
      pkgs.twitter-color-emoji # Twitter Color Emoji
      pkgs.symbola # tudo q é simbolo de escritas exotivas
    ];
    fontconfig.defaultFonts = lib.mkForce {
      emoji = [ "Twitter Color Emoji" ];
      serif = [ "CodeNewRoman Nerd Font" ];
      sansSerif = [ "CodeNewRoman Nerd Font" ];
      monospace = [ "CodeNewRoman Nerd Font" ];
    };
  };

  console.keyMap = "br-abnt2";
  # Enable sound with pipewire.

  sound.enable = true;
  hardware = {
    pulseaudio.enable = false;
    sane = { # scanner
      enable = true;
      extraBackends = [ pkgs.sane-airscan ];

    };
  };
  security = {
    rtkit.enable = true;# nixos wiki pipewire
    sudo-rs.enable= true;
  };

  services = {
    udev.packages = [ pkgs.rwedid ];
    persistent-evdev.enable =true;
    system76-scheduler.enable = true;
    mysql = {
    enable = false;
    package= pkgs.mariadb;
    };

    power-profiles-daemon.enable=true;# enable power profile selection
    fwupd= {# sudo fwupdmgr update
      enable = true;
      #extraRemotes = ["lvfs" "vendor" "vendor-directory"]
    };
    xserver = {
      enable = true;
      layout = "br";
      xkbVariant = "abnt2";
      displayManager = {
        sddm.enable = true;
      };
      desktopManager = {
        plasma5.enable = true;
      };
      windowManager = {
        qtile.enable =false;
        herbstluftwm.enable = false;
        leftwm.enable = false;
      };

    };
    xrdp = {
      enable = false; # not work on wayland
      defaultWindowManager = "startplasma-x11";
    };
    openssh = {
      enable=false;
      settings ={

        PasswordAuthentication = true;
        KbdInteractiveAuthentication = true;
      };
    };
    flatpak.enable = true;

    printing = {
    # Enable CUPS to print documents.
      enable = true;
      drivers = [ pkgs.gutenprint ];
    };
    avahi = {
      enable = true;
      nssmdns = true;
      # wifi(IPP) printers
      #openFirewall = true;
    };
    tailscale.enable = false;
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
      daemon.enable = true;
      updater.enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    #xserver.libinput.enable = true;
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tmp = {
    isNormalUser = true;
    description=  "tmp temporario";

    extraGroups = [ "scanner" "lp" "networkmanager"];
    };

  users.extraGroups.vboxusers.members = [ "dnl" ];
  users.users.dnl = {
    isNormalUser = true;
    # shell = pkgs.fish;
    description = "dnl padrão";
    extraGroups = [ 
    "i2c"
    "scanner" "lp" "networkmanager" "wheel" "libvirtd"
    ];
    packages = with pkgs; [ distrobox ];
  };
  nixpkgs.config.allowUnfree = true;

  # $ nix search wget
  environment = {
    shells = [ pkgs.fish ];
    variables = {
      EDITOR = "hx";
      VISUAL = "hx";
      SUDO_EDITOR = "hx";
    };


    defaultPackages = lib.mkForce [ pkgs.helix ];
    systemPackages = with pkgs; [

      xfce.thunar
      xfce.thunar-volman
      xfce.thunar-archive-plugin
      xfce.thunar-media-tags-plugin


      flameshot # screenshot , flatpak

      git
      gh



      cargo-cross # rust cross-platforma target build
      qemu_kvm
      qutebrowser
      devbox #best container system for dev

      zathura #pdf reader with vim motions
      deja-dup # simple file backup system

      quickemu #simple qemu vm 

      xwaylandvideobridge #fix discord screen share on wayland
      
      ddcutil #monitor virt-manager keybind

      wlr-randr
      brise # rime schemes
      kate # text editor
      xclip # copy/cur terminal xorg
      wl-clipboard # copy cut terminal wayland
      steam-run # run normal binary linux apps
      gnome.gnome-software
      libsForQt5.powerdevil
      libsForQt5.ark
      unp # unpack zip,tar,gz...
      firefox-esr
      solaar # logitech keyboard change FN key

      

      kinfocenter
      hardinfo
      pciutils

      rocmPackages.clr
      rocmPackages.rocminfo
      rocmPackages.rocm-smi

      virtio-win

    ];
  };
  virtualisation = {
    #tpm.enable = true;
    #oci-containers = {
    #  backend = "podman";
    #  containers = {
    #    container-name = {
    #      image = "container-image";
    #      autoStart = true;
    #      ports = [ "127.0.0.1:1234" ];
    #    };
    #  };
    #};
    waydroid.enable=false;
    virtualbox.host = {
      enable = false;
      enableExtensionPack = false;

    };
    #lxd.recommendedSysctlSettings = true;
    libvirtd = {
      enable = true;
      qemu.swtpm.enable= true;
      };
    podman = {
      enable = true;
      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enable = true;

     # networkSocket.enable=false;
    };
  };
  system.copySystemConfiguration=true; #  /run/current-system/configuration.nix
  # system.userActivationScripts = {
    # flatpak_local_font.text = ''
    # if [[ ! -h "$HOME/.local/share/fonts" ]]; then
    #   ln -s /run/current-system/sw/share/X11/fonts ~/.local/share/fonts
    # fi
    # '';
  # };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
