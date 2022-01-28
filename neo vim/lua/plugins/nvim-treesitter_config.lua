---syntax highlight

require("nvim-treesitter.parsers").get_parser_configs().fsharp = {
  install_info = {
    -- url = "https://github.com/baronfel/tree-sitter-fsharp",
    url = "~/.config/nvim/tree-sitter-fsharp/",
    files = { "src/parser.c" },
  },
  filetype = "fsharp",
}
require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
  },
})
