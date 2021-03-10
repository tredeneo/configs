--[[
---Using meta-accessors
vim.o.{option}: global options
vim.bo.{option}: buffer-local options
vim.wo.{option}: window-local options
--]]
--


-- ---Using meta-accessors
-- vim.g.{name}: global variables
-- vim.b.{name}: buffer variables
-- vim.w.{name}: window variables
-- vim.t.{name}: tabpage variables
-- vim.v.{name}: predefined Vim variables
-- vim.env.{name}: environment variables
-- 


--cursor:normal-inserir-visual-comando=linha verical,substituir=linha horizontal
vim.o.guicursor='n-i-v-c:ver100-blinkon1,r:hor100-blinkon0'
--plugins
vim.cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
paq {'savq/paq-nvim', opt=true}   

--numeros relativos
vim.wo.number = true
vim.wo.relativenumber = true -- same as vim.api.nvim_win_set_option(0, 'number', true)

--pesquisa em tempo real
vim.o.incsearch = true

vim.o.confirm = true
vim.o.ignorecase = true

--Avoid showing message extra message when using completion
-- vim.cmd 'set shortmess+=c'
--sla a diferença desses 2
--set shortmess+=A

--cor da janela flutuante
vim.cmd 'highlight Pmenu ctermbg=0 ctermfg=15'
vim.cmd 'highlight PmenuSel ctermbg=15'

--cancelar carecteres selecionados
vim.api.nvim_set_keymap('n',
                        '<ESC>',
                        ':nohlsearch<CR> ',
                        {noremap=true,silent=true})



--mover linhas
vim.cmd 'vnoremap <A-k> :m \'<-2<CR>gv=gv'
vim.cmd 'vnoremap <A-j> :m \'>+1<CR>gv=gv'
vim.api.nvim_set_keymap('n',
                        '<A-k>',
                        ':m .-2<CR>==',
                        {noremap=true})
vim.api.nvim_set_keymap('n',
                        '<A-j>',
                        ':m .+1<CR>==',
                        {noremap=true})


---menu de completar negação tipo vim
vim.api.nvim_set_keymap('i',
                        '<C-j>', 
                        'pumvisible() ? "\\<C-n>" : "\\<C-j>"', 
                        {expr = true})
vim.api.nvim_set_keymap('i',
                        '<C-k>',
                        'pumvisible() ? "\\<C-p>" : "\\<C-k>"', 
                        {expr = true})

--snippets precisa do python3
--paq 'SirVer/ultisnips'
vim.g.completion_enable_snippet = 'UltiSnips'

--parenteses coloridos
paq 'luochen1990/rainbow'
vim.cmd 'let g:rainbow_active = 1'
-- paq 'p00f/nvim-ts-rainbow' --alternativa em lua

--mostrar indendação
paq 'nathanaelkane/vim-indent-guides'
-- paq 'glepnir/indent-guides.nvim' --alternativa em lua
-- require('indent_guides').setup()

---
paq 'blackCauldron7/surround.nvim'
require'surround'.setup{}

paq 'b3nj5m1n/kommentary'
--require('kommentary.config').use_extended_mappings()
require('kommentary.config')
require('kommentary.config').configure_language("default", {
    single_line_comment_string="//",
    prefer_single_line_comments= true,
    use_consistent_indentation= true,
    ignore_whitespace=true,
})

paq 'nvim-lua/popup.nvim'
paq 'nvim-lua/plenary.nvim'

-- finder
paq 'nvim-telescope/telescope.nvim'
vim.api.nvim_set_keymap('n',
                        '<Space><Space>',
                        '<cmd>lua require(\'telescope.builtin\').find_files()<cr>',
                        {noremap=true})

vim.cmd 'set ts=4 sw=2 et'
vim.cmd 'let g:indent_guides_start_level=1'
vim.cmd 'let g:indent_guides_guide_size=4'
vim.cmd 'let g:indent_guides_enable_on_vim_startup = 1'
paq 'nvim-treesitter/nvim-treesitter'


--explorador de arquivos
paq 'kyazdani42/nvim-web-devicons' -- for file icons
paq 'kyazdani42/nvim-tree.lua'
vim.api.nvim_set_keymap('n',
                        '<C-n>',
                        ':NvimTreeToggle<CR>',
                        {noremap=false})


--statusline
paq 'hoob3rt/lualine.nvim'
require('lualine').status{
        options = {
          theme = 'gruvbox',
    }
}
vim.o.showtabline = 2
-- vim.o.tabline = vim.o.statusline
-- vim.o.statusline = ' '

-- fechar paretes,chaves
paq 'windwp/nvim-autopairs'
require('nvim-autopairs').setup()




--completar 
--Set completeopt to have a better completion experience
vim.cmd "setlocal omnifunc=v:lua.vim.lsp.omnifunc"
vim.o.completeopt = 'menuone,noselect,noinsert'
vim.api.nvim_set_keymap('n', 
                        '<space>a', 
                        '<cmd>lua vim.lsp.buf.code_action()<CR>',
                        {noremap=false})

vim.api.nvim_set_keymap('i',
			'<c-space>',
			'<cmd>lua vim.lsp.buf.completion()<CR>',
			{noremap=true,silent=true})

vim.api.nvim_set_keymap('n',
			'gD',
			'<cmd>lua vim.lsp.buf.definition()<CR>',
			{silent=true})

vim.api.nvim_set_keymap('n',
			'gd',
			'<cmd>lua vim.lsp.buf.declaration()<CR>',
			{silent=true})

vim.api.nvim_set_keymap('n',
                        "?",
                        "<cmd>lua vim.lsp.buf.hover()<cr>",
                        { 
                          noremap = true, 
                          silent = true
                        })
---LSP-----------------------------------------------------------------
paq 'nvim-lua/lsp_extensions.nvim'
paq 'neovim/nvim-lspconfig'
paq 'nvim-lua/completion-nvim'
-- c
require'lspconfig'.clangd.setup{
    on_attach=require'completion'.on_attach
}

----- flutter
paq 'akinsho/flutter-tools.nvim'
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
-- paq 'TimUntersberger/neogit'
