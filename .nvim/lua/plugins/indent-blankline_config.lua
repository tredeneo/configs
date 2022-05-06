---cor da janela flutuante
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#ff0000 blend=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#00ff00 blend=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#0000ff blend=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#ffff00 blend=nocombine]])
vim.opt.list = true
require("indent_blankline").setup({
  -- char_list ={'|', '¦', '┆', '┊'},
  char_highlight_list = { --"visual_char_1", "visual_char_2"},
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
  },
  show_trailing_blankline_indent = true,
  space_char_highlight_list = {
    "Visual",
    "VisualNC",
  },
  filetype_exclude = { "dashboard" },
  show_current_context = true,
})
