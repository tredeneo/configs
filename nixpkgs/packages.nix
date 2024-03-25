{ pkgs, ... }: {

  home.packages = with pkgs; [
    #/* rnix-lsp */
    nixfmt

    slint-lsp
    # rustup
    # rust-analyzer
    cargo-whatfeatures

    vlc

    #gitAndTools.gitFull
    anki-bin
    #mpv
    gitui

    # ksystemlog
    lshw
    dmidecode

    valgrind # --tool=mem check ./a.out

    # pipx
    calibre
    sqlitebrowser
    lxappearance

    #"+si:localuser:$USER"
    xorg.xhost
    yt-dlp # -x   #audio
    viu

    #kdiskmark # equivalent crystal disk bench
    #filelight
    #nur.repos.utybo.git-credential-manager
    stylua
    #black
    #dotnet-sdk
  ];

}
