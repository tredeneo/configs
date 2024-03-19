return { --flutter
  "akinsho/flutter-tools.nvim",
  ft = { "dart" },
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  config = {
    widget_guides = {
      enable = true,
    },
    lsp = {
      --on_attach = require("lsp-format").on_attach,
    },
    debugger = {
      enable = true,
    },
  },
  -- ft= "dart",
}
