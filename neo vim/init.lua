--cursor:normal-inserir-visual-comando=linha verical,substituir=linha horizontal

vim.cmd 'set guicursor=n-i-v-c:ver100-blinkon1,r:hor100-blinkon0'

--plugins
vim.cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
paq {'savq/paq-nvim', opt=true}   

--numeros relativos
vim.wo.number = true
vim.wo.relativenumber = true -- same as vim.api.nvim_win_set_option(0, 'number', true)


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

--cancelar carecteres selecionados
vim.api.nvim_set_keymap('n','<ESC>',':nohlsearch<CR> ',{noremap=true})



--mover linhas
vim.cmd 'vnoremap <A-k> :m \'<-2<CR>gv=gv'
vim.cmd 'vnoremap <A-j> :m \'>+1<CR>gv=gv'
vim.api.nvim_set_keymap('n','<A-k>',':m .-2<CR>==',{noremap=true})
vim.api.nvim_set_keymap('n','<A-j>',':m .+1<CR>==',{noremap=true})



vim.api.nvim_set_keymap('i', '<C-j>', 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', {expr = true})
vim.api.nvim_set_keymap('i', '<C-k>', 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', {expr = true})

--snippets precisa do python3
--paq 'SirVer/ultisnips'
vim.g.completion_enable_snippet = 'UltiSnips'

--parenteses coloridos
paq 'luochen1990/rainbow'
vim.cmd 'let g:rainbow_active = 1'

--mostrar indendação
paq 'nathanaelkane/vim-indent-guides'
paq 'nvim-lua/popup.nvim'
paq 'nvim-lua/plenary.nvim'

-- finder
paq 'nvim-telescope/telescope.nvim'
vim.api.nvim_set_keymap('n','<Space><Space>','<cmd>lua require(\'telescope.builtin\').find_files()<cr>',{noremap=true})

vim.cmd 'set ts=4 sw=2 et'
vim.cmd 'let g:indent_guides_start_level=1'
vim.cmd 'let g:indent_guides_guide_size=2'
vim.cmd 'let g:indent_guides_enable_on_vim_startup = 1'
paq 'nvim-treesitter/nvim-treesitter'


--explorador de arquivos
paq 'kyazdani42/nvim-web-devicons' -- for file icons
paq 'kyazdani42/nvim-tree.lua'


--statusline
--paq 'glepnir/galaxyline.nvim'
--require('galaxyline').section.left

-- fechar paretes,chaves
paq 'windwp/nvim-autopairs'
require('nvim-autopairs').setup()



--completar 
--Set completeopt to have a better completion experience
--vim.cmd 'set completeopt=longest,menuone,noinsert,noselect'
vim.o.completeopt = 'menuone,longest'--,noselect'
vim.api.nvim_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>',{noremap=false})

--LSP-----------------------------------------------------------------

paq 'neovim/nvim-lspconfig'
paq 'nvim-lua/completion-nvim'
-- c
require'lspconfig'.clangd.setup{on_attach=require'completion'.on_attach}

----- flutter
paq 'akinsho/flutter-tools.nvim'
--[[
require("flutter-tools").setup {
  flutter_outline={enable = true},
  lsp = {one_attach=require'completion'.on_attach}
}
--]]
require'lspconfig'.dartls.setup(
{
  on_attach=require'completion'.on_attach;
  init_options = {
    closingLabels = true;
  }
}
)

-------rust
require'lspconfig'.rust_analyzer.setup{on_attach=require'completion'.on_attach}

require'nvim-treesitter.configs'.setup{
    highlight={
        enable=true
    }
}

--code actions
--[[
paq 'RishabhRD/popfix'
paq 'RishabhRD/nvim-lsputils'
vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
--]]
