return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufWritePre",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
        sources = {
          null_ls.builtins.formatting.nixfmt,
          null_ls.builtins.formatting.stylua.with({
            extra_args = {
              "--indent-type=Spaces",
              "--indent-width=2",
            },
          }),
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end,
      })
    end,
    enable = false,
}
