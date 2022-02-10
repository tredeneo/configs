vim.cmd("setlocal foldmethod=indent")
vim.cmd("set nofoldenable") --n recolher ao inciar
vim.cmd("set foldlevel=99")
require("pretty-fold").setup({
  fill_char = "━",
  keep_indentation = true,
  sections = {
    left = {
      -- "━",
      -- function()
      --   return string.rep("━", vim.v.foldlevel)
      -- end,
      "━┫",
      "content",
      "┣",
    },
    right = {
      "┫ ",
      "number_of_folded_lines",
      ": ",
      "percentage",
      -- " ┣━━",
    },
  },
})
require("pretty-fold.preview").setup({
  key = "l",
})
