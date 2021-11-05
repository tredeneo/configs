--- c
require("lspconfig").clangd.setup({
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--suggest-missing-includes",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
    },
})

require("lspconfig").texlab.setup({})
----- flutter
require("flutter-tools").setup({
    widget_guides = {
        enable = true,
    },
    lsp = {},
    debugger = {
        enable = true,
    },
})

-------rust
require("rust-tools").setup({})

---python
require("lspconfig").pylsp.setup({
    enable = true,
    settings = {
        configurationSources = { "flake8" },
        plugins = {
            jedi = { enabled = false },
            rope = { enabled = true, eager = true },
            capabilities = capabilities,
        },
    },
})

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
---janela de erros
require("trouble").setup({})

---melhora no lsp
require("navigator").setup({
    -- default_mapping = false,
    treesitter_analysis = false,
    transparency = 100,
    icons = {
        diagnostic_err = "",
        diagnostic_warn = "",
        diagnostic_info = "",
        diagnostic_hint = "",
    },
    lsp = { format_on_save = false },
})
