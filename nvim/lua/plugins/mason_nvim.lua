return {
  "williamboman/mason.nvim",
  dependecies = { "williamboman/mason-lspconfig.nvim", "mfussenegger/nvim-dap", "neovim/nvim-lspconfig" },
  config = function()
    require("mason").setup({})
  end,
}
