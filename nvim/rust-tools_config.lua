return { --rust
  "simrat39/rust-tools.nvim",
  ft = { "rust" },
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
  },
  config = function()
    require("rust-tools").setup({

    --[[
       server = {
        on_attach = require("lsp-format").on_attach,
      },
    }) 
    ]]--
    require("rust-tools.inlay_hints").set()
  end,
  ft = "rust",
}
