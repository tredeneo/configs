{ pkgs, lib, config, ... }: {
  imports = [
    ./programs/fish.nix
    ./programs/helix.nix
    ./programs/starship.nix
    ./programs/kitty.nix
    ./programs/zellij.nix
    ./programs/neovim.nix
  ];
  xdg.configFile."rofi/onedark.rasi".source = ./rofi/onedark.rasi;
  programs = {
    bat.enable = true;
    bottom.enable = true;
    home-manager.enable = true;
    nushell.enable = true;
    rofi = {
      enable = true;
      extraConfig = { modi = "drun,window,combi"; };
      theme = "Adapta-Nokto";
    };
  };

}
