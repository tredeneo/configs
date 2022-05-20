{ ... }:
{
  imports = [
    ./programs/fish.nix
    ./programs/helix.nix
    ./programs/starship.nix
    ./programs/kitty.nix
    ./programs/zellij.nix
  ];
  programs = {
    emacs.enable = true;
    bat.enable = true;
    bottom.enable = true;
    home-manager.enable = true;
    nushell.enable = true;
  };


}
