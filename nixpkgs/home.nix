#~/.config/nixpkgs/home.nix
{ pkgs, ... }:

{
  imports = [
    ./programs.nix
  ];
  home = {
    username = "dnl";
    homeDirectory = "/home/dnl";

    stateVersion = "22.05";

    sessionPath = [
      "$HOME/.local/bin/"
      "$HOME/.nix-profile/bin/"
      "$HOME/.dotnet/tools/"
    ];
    packages = with pkgs ;[
      rnix-lsp

      nodejs
      nodePackages.npm
      nodePackages.typescript-language-server

      rustup
      rust-analyzer

      black
      dotnet-sdk
    ];
  };
  i18n.inputMethod = {
    enabled = "fcitx5";
  };
  xdg.systemDirs = {
    data = [ "~/.nix-profile/share/" ];
  };
  targets.genericLinux.enable = true;


}
