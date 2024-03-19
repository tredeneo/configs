-- nvim-cmp supports additional completion capabilities
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_format = require("lsp-format").on_attach

return {
  "neovim/nvim-lspconfig",
  config = function()
    require("lspconfig").tsserver.setup({
      on_attach = lsp_format,
      copabilities = capabilities,
    })

    require("lspconfig").slint_lsp.setup({})
    vim.cmd([[ autocmd BufRead,BufNewFile *.slint set filetype=slint ]])

    require("lspconfig").clangd.setup({
      capabilities = capabilities,
      on_attach = lsp_format,
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--suggest-missing-includes",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
        -- "style=microsoft"
      },
    })
    require("lspconfig").pyright.setup({
      -- disableLanguageServices = true,
    })
    require("lspconfig").fsautocomplete.setup({})
    require("lspconfig").nimls.setup({})
    require("lspconfig").gopls.setup({})
    -- require("lspconfig").hls.setup({})
  end,
}
