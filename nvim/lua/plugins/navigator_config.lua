-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
---melhora no lsp
require("navigator").setup({
  -- treesitter_analysis = false,
  -- default_mapping = false,
  transparency = 100,
  icons = {
    diagnostic_err = "",
    diagnostic_warn = "",
    diagnostic_info = "",
    diagnostic_hint = "",
  },
  lsp = {
    disable_lsp = {
      -- "dartls",
      "pyright",
      "jedi_language_server",
      "lua-language-server",
      "sumneko_lua",
      -- "omnisharp",
      "csharp_ls",
      "npx",
      "ngserver",
      -- "denols",
      "tsserver",
      "flow",
    },
    format_on_save = false,
    servers = { "pylsp", "gopls", "clangd", "fsautocomplete", "csharp_ls", "hls" },
  },
})
