local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
--- c
require'lspconfig'.clangd.setup{
  capabilities = capabilities,
    cmd = { "clangd",
            "--background-index",
            "--clang-tidy",
            "--suggest-missing-includes",
            "--completion-style=detailed",
            "--header-insertion=iwyu"}
}

----- flutter
require("flutter-tools").setup{
  widget_guides = {
    enable = true,
  },
  lsp = {
    capabilities = capabilities,
  }
}
require("telescope").load_extension("flutter")
-------rust
require('rust-tools').setup({
  -- server = {capabilities = capabilities},
})

---python
require'lspconfig'.pyls.setup{
  configurationSources = { "flake8", "black"},
  plugins = {
        flake8 = {enabled = true},
        -- black = { enabled = true},
  },
}

---syntax highlight
require('nvim-treesitter.configs').setup{
    highlight={
        enable=true
    }
}
---teclas possiveis
require("which-key").setup{}


---movimentação suave
require('neoscroll').setup({
mappings = {'<C-u>', '<C-d>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb'}
})

---janela de erros
require("trouble").setup{}

--- fechar paretes,chaves
require('nvim-autopairs').setup()

---comentarios
--require('kommentary.config').use_extended_mappings()
require('kommentary.config')
require('kommentary.config').configure_language("default", {
    single_line_comment_string="//",
    prefer_single_line_comments= true,
    use_consistent_indentation= true,
    ignore_whitespace=true,
})

---melhora no lsp
require 'lspsaga'.init_lsp_saga({
  error_sign = "E",
  warn_sign = "W",
  hint_sign = "H",
  infor_sign = "I",
})


---
require'surround'.setup{}

--barra de status
require('lualine').setup{
        options = {
          theme = 'gruvbox',
    }
}


require'compe'.setup{
  preselect = "disable"; 
  source = {
    cal =true;
    path = true;
    buffer = true;
    nvim_lsp = true;
    nvim_lua = true;
    snippets_nvim =true;
    tag = true;
   },
}

---tabs superiores
require'bufferline'.setup{
  options = {
    diagnostics = "nvim_lsp"
  }
}

---snippets
require'snippets'.use_suggested_mappings()

--icones (nerd fonts)
require'nvim-web-devicons'.setup()


---selectionar opções de completar
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<Down>"
    else
        return vim.fn['compe#complete']()

    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<Up>"
    else
        return t "<S-Tab>"
    end
end

vim.api.nvim_set_keymap("i", "<C-j>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-k>", "v:lua.s_tab_complete()", {expr = true})
