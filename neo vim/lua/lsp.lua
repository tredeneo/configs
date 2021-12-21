-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

--- c
if vim.bo.filetype == "c" then
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
end

if vim.bo.filetype == "typescript" then
    require("lspconfig").denols.setup({})
end
if vim.bo.filetype == "tex" then
    require("lspconfig").texlab.setup({})
end
----- flutter
if vim.bo.filetype == "dart" then
    require("flutter-tools").setup({
        widget_guides = {
            enable = true,
        },
        lsp = {},
        debugger = {
            enable = true,
        },
    })
end

-------rust
if vim.bo.filetype == "rust" then
    require("rust-tools").setup({})
    require("rust-tools.standalone").start_standalone_client()
end

---python
if vim.bo.filetype == "python" then
    require("lspconfig").pylsp.setup({
        -- enable = true,
        settings = {
            configurationSources = { "flake8" },
            plugins = {
                flake8 = { enabled = false },
                jedi = { enabled = false },
                rope = { enabled = true, eager = true },
                capabilities = capabilities,
            },
        },
    })
end

---janela de erros
require("trouble").setup({})

require("lsp_signature").setup()
---melhora no lsp
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
    lsp = { format_on_save = false },
})
