{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      zig # install tree-sitter langs
      ripgrep
      fd # telescope
      bash
    ];
    /* plugins = [
       (pkgs.vimPlugins.nvim-treesitter.withPlugins (lang: [
         lang.markdown
       ]))
    */
    # ];
    withPython3 = false;
    withRuby = false;

  };
}
