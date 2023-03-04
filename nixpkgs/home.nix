# ~/.config/nixpkgs/home.nix
{ ... }:

{
  imports = [ ./programs.nix ./packages.nix ];
  home = {
    username = "dnl";
    homeDirectory = "/home/dnl";

    stateVersion = "22.05";

    sessionPath = [
      "$HOME/.local/bin/"
      "$HOME/.nix-profile/bin/"
      #"$HOME/.dotnet/tools/"
    ];
    sessionVariables = {
      GPG_TTY = "$(tty)";

    };
  };
  xdg.systemDirs = { data = [ "~/.nix-profile/share/" ]; };
  targets.genericLinux.enable = true;

}
