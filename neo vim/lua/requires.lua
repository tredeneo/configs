require("telescope").load_extension("flutter")
require("telescope").load_extension("neoclip")
require("telescope").load_extension("projects")

require("formatter").setup({
    filetype = {
        python = {
            function()
                return { exe = "black", args = { "-" }, stdin = true }
            end,
        },
        rust = {
            function()
                return {
                    exe = "rustfmt",
                    args = { "--edition=2021", "--emit=stdout" },
                    stdin = true,
                }
            end,
        },
        c = {
            function()
                return {
                    exe = "clang-format",
                    args = { "--assume-filename=", vim.api.nvim_buf_get_name(0), "--style=microsoft" },
                    stdin = true,
                    -- cwd = vim.fn.expand("%:p:h"),
                }
            end,
        },
        lua = {
            function()
                return {
                    exe = "stylua",
                    args = {
                        "-",
                        "--indent-type Spaces",
                    },
                    stdin = true,
                }
            end,
        },
    },
})

-- require("marks").setup({})

---syntax highlight
require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
    },
    rainbow = {
        enable = true,
    },
})
require("project_nvim").setup({})
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_respect_buf_cwd = 1
require("nvim-tree").setup({
    update_cwd = true,
    auto_close = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
})
---escurecer
require("twilight").setup({})
---teclas possiveis
require("which-key").setup({})

---movimentação suave
require("neoscroll").setup({})

---listagem do copiar
require("neoclip").setup()

--tema
require("github-theme").setup()

--- fechar paretes,chaves
require("nvim-autopairs").setup()

---comentarios
--require('kommentary.config').use_extended_mappings()
require("kommentary.config")
require("kommentary.config").configure_language("default", {
    single_line_comment_string = "//",
    prefer_single_line_comments = true,
    use_consistent_indentation = true,
    ignore_whitespace = true,
})

---cor da janela flutuante
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#ff0000 blend=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#00ff00 blend=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#0000ff blend=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#ffff00 blend=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent1 guibg=#1f1f1f blend=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guibg=#1a1a1a blend=nocombine]])
vim.opt.list = true
require("indent_blankline").setup({
    -- char_list ={'|', '¦', '┆', '┊'},
    char_highlight_list = { --"visual_char_1", "visual_char_2"},
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
    },
    show_trailing_blankline_indent = true,
    space_char_highlight_list = {
        "Visual",
        "VisualNC",
    },
    filetype_exclude = { "dashboard" },
    show_current_context = true,
})

---adicionar/remove/substituir caractes em volta
require("surround").setup({})

--barra de status
require("lualine").setup({
    options = {
        theme = "github",
    },
})

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- vim.o.completeopt = "menuone,noinsert, noselect"
local cmp = require("cmp")
cmp.setup({
    preselect = cmp.PreselectMode.None,
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if vim.fn["vsnip#available"]() == 1 then
                cmp.select_next_item("<Plug>(vsnip-expand-or-jump)", "")
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function()
            if vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, {
            "i",
            "s",
        }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "buffer" },
        { name = "path" },
    },
})

---tabs superiores
require("bufferline").setup({
    options = {
        diagnostics = "nvim_lsp",
    },
})

--icones (nerd fonts)
require("nvim-web-devicons").setup()

require("stabilize").setup()
