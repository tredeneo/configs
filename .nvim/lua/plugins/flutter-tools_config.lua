require("telescope").load_extension("flutter")
require("flutter-tools").setup({
  widget_guides = {
    enable = true,
  },
  lsp = {},
  debugger = {
    enable = true,
  },
})
