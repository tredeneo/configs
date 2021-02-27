--cursor:normal-inserir-visual-comando=linha verical,substituir=linha horizontal

vim.cmd 'set guicursor=n-i-v-c:ver100-blinkon1,r:hor100-blinkon0'

vim.cmd 'packadd paq-nvim'

--numeros relativos
vim.wo.number = true
vim.wo.relativenumber = true -- same as vim.api.nvim_win_set_option(0, 'number', true)


--Set completeopt to have a better completion experience
vim.cmd 'set completeopt=menuone,noinsert,noselect'
--Avoid showing message extra message when using completion
vim.cmd 'set shortmess+=c'
--sla a diferença desses 2
--set shortmess+=A

--mudar blocos coloridos de erro para caractere sublinhado de erro
--vim.cmd 'hi spellBad cterm=underline ctermbg=NONE'
--vim.cmd 'hi SpellCap cterm=underline ctermbg=NONE'

--cor da janela flutuante
vim.cmd 'highlight Pmenu ctermbg=8'
vim.cmd 'highlight PmenuSel ctermbg=7'

--mover linhas
vim.cmd 'vnoremap <A-k> :m \'<-2<CR>gv=gv'
vim.cmd 'vnoremap <A-j> :m \'>+1<CR>gv=gv'
vim.api.nvim_set_keymap('n','<A-k>',':m .-2<CR>==',{noremap=true})
vim.api.nvim_set_keymap('n','<A-j>',':m .+1<CR>==',{noremap=true})
vim.g.completion_enable_snippet = 'UltiSnips'


vim.api.nvim_set_keymap('i', '<C-j>', 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', {expr = true})
vim.api.nvim_set_keymap('i', '<C-k>', 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', {expr = true})

--plugins
local paq = require('paq-nvim').paq
paq {'savq/paq-nvim', opt=true}   
paq 'nvim-lua/completion-nvim'
paq 'neovim/nvim-lspconfig'
paq 'akinsho/flutter-tools.nvim'
--paq 'honza/vim-snippets'
--parenteses coloridos
paq 'luochen1990/rainbow'
--mostrar indendação
paq 'nathanaelkane/vim-indent-guides'
paq 'nvim-lua/popup.nvim'
paq 'nvim-lua/plenary.nvim'
paq 'nvim-telescope/telescope.nvim'
vim.api.nvim_set_keymap('n','<Space><Space>','<cmd>lua require(\'telescope.builtin\').find_files()<cr>',{noremap=true})

vim.cmd 'set ts=4 sw=4 et'
vim.cmd 'let g:indent_guides_start_level=1'
vim.cmd 'let g:indent_guides_guide_size=4'
vim.cmd 'let g:indent_guides_enable_on_vim_startup = 1'
paq 'nvim-treesitter/nvim-treesitter'


--explorador de arquivos
paq 'kyazdani42/nvim-web-devicons' -- for file icons
paq 'kyazdani42/nvim-tree.lua'

--statusline
--paq 'glepnir/galaxyline.nvim'
--plugins config
require'lspconfig'.clangd.setup{on_attach=require'completion'.on_attach}
require("flutter-tools").setup{}
require'lspconfig'.dartls.setup{on_attach=require'completion'.on_attach,
init_options={closingLabels=true},
    --filetypes={"dart"},
    --cmd={"dart" ,"~/flutter/bin","--lsp"},

}
require'lspconfig'.rust_analyzer.setup{on_attach=require'completion'.on_attach}
require'nvim-treesitter.configs'.setup{
    highlight={
        enable=true
    }
}
vim.cmd 'let g:rainbow_active = 1'
