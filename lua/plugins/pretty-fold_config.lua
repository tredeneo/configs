vim.cmd("setlocal foldmethod=indent")
vim.cmd("set nofoldenable") --n recolher ao inciar
vim.cmd("set foldlevel=99")
return { -- melhor aparencia dos fold(recolher blocos)
  "anuvyklack/pretty-fold.nvim",
  event = "VeryLazy",
  config = {
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
  },
}
