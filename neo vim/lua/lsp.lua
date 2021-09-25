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

require("lspconfig").hls.setup({})

----- flutter
require("flutter-tools").setup({
    widget_guides = {
        enable = true,
    },
    lsp = {},
})

-------rust
require("rust-tools").setup({})

---python
require("lspconfig").pylsp.setup({
    enable = true,
    settings = {
        pylsp = {
            configurationSources = { "flake8" },
            plugins = {
                flake8 = {
                    enabled = true,
                    ignore = { "E203", "W503" },
                    maxLineLength = 88,
                },
            },
        },
    },
})

---janela de erros
require("trouble").setup({})

---melhora no lsp
require("lspsaga").init_lsp_saga({
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = "",
    code_action_prompt = {
        enable = false,
        sign = false,
        virtual_text = false,
    },
})
