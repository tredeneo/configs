--- c
require'lspconfig'.clangd.setup{
    on_attach=require'completion'.on_attach
}

----- flutter
require("flutter-tools").setup{
  flutter_lookup_cmd="echo $HOME/snap/flutter/common/flutter/bin", --n funciona
  flutter_outline={enable = true},
  lsp = {on_attach=require'completion'.on_attach}
}
-------rust
require'lspconfig'.rust_analyzer.setup{
    on_attach=require'completion'.on_attach
}
-- require'lsp_extensions'.inlay_hints()

---syntax highlight
require('nvim-treesitter.configs').setup{
    -- indent={enable=true};
    highlight={
        enable=true
    },
    -- rainbow={
    --   enable=true
    -- }
}

--- fechar paretes,chaves
require('nvim-autopairs').setup()

---statusline
require('lualine').status{
        options = {
          theme = 'gruvbox',
    }
}

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
require 'lspsaga'.init_lsp_saga()


---
require'surround'.setup{}

---barra de status
require('lualine').status{
        options = {
          theme = 'gruvbox',
    }
}
