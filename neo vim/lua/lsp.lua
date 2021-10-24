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
        pylsp = {
            configurationSources = { "flake8", "mypy" },
            plugins = {
                flake8 = {
                    enabled = true,
                    ignore = { "E203", "W503", "E501" },
                    maxLineLength = 88,
                },
            },
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
