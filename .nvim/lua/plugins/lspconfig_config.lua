-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

require("lspconfig").clangd.setup({
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--suggest-missing-includes",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
  },
})

require("lspconfig").pylsp.setup({
  on_attach = require("aerial").on_attach,
  settings = {
    pylsp = {
      filetype = { "python" },
      configurationSources = { "flake8" },
      plugins = {
        flake8 = { enabled = true, maxLineLength = 88, ignore = { "F811" } },
        jedi = { enabled = true },
        rope = { enabled = true, eager = true },
        pylint = { enabled = false },
        pycodestyle = { enabled = false },
        pyflakes = { enabled = false },
        -- capabilities = capabilities,
      },
    },
  },
})

vim.cmd([[autocmd BufNewFile,BufRead *.fs,*.fsx,*.fsi set filetype=fsharp]])
require("lspconfig").fsautocomplete.setup({
  on_attach = require("virtualtypes").on_attach,
})

require("lspconfig").hls.setup({
  on_attach = require("virtualtypes").on_attach,
})
