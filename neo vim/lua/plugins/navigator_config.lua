-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

---melhora no lsp
require("lspconfig").fsautocomplete.setup({})
require("lspconfig").csharp_ls.setup({})
require("navigator").setup({
  -- default_mapping = false,
  -- treesitter_analysis = false,
  transparency = 100,
  icons = {
    diagnostic_err = "",
    diagnostic_warn = "",
    diagnostic_info = "",
    diagnostic_hint = "",
  },
  lsp = {
    disable_lsp = {
      "dartls",
      "rust_analyzer",
      "pyright",
      "jedi_language_server",
      "lua-language-server",
      "sumneko_lua",
      "omnisharp",
    },
    format_on_save = false,
    clangd = {
      capabilities = capabilities,
      filestypes = { "c", "cpp", "cc", "h", "hpp" },
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--suggest-missing-includes",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
      },
    },
    pylsp = {
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
    },
    servers = { "pylsp", "gopls", "clangd" },
  },
})
