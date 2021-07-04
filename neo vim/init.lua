---outros arquivos

require("plugins")
require("map")
require("requires")
require("execut")


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

--vim.cmd "let g:dart_format_on_save = 1"
--cursor:normal-inserir-visual-comando=linha verical,substituir=linha horizontal
vim.o.guicursor='n-i-v-c:ver100-blinkon1,r:hor100-blinkon0'
--plugins


---numeros relativos
vim.wo.number = true
vim.wo.relativenumber = true -- same as vim.api.nvim_win_set_option(0, 'number', true)

---pesquisa em tempo real
vim.o.incsearch = true

vim.o.confirm = true
vim.o.ignorecase = true

--Avoid showing message extra message when using completion
-- vim.cmd 'set shortmess+=c'
--sla a diferença desses 2
--set shortmess+=A

---cor da janela flutuante
vim.cmd 'highlight Pmenu ctermbg=1 ctermfg=15'
vim.cmd 'highlight PmenuSel ctermbg=15'

---parenteses coloridos
vim.cmd 'let g:rainbow_active = 1'

---tabs configs
vim.cmd 'set ts=4 sw=2 et'
vim.cmd 'let g:indent_guides_start_level=1'
vim.cmd 'let g:indent_guides_guide_size=4'
vim.cmd 'let g:indent_guides_enable_on_vim_startup = 1'

vim.o.showtabline = 2

---lsp
-- vim.cmd "setlocal omnifunc=v:lua.vim.lsp.omnifunc"

---n pedir pra salvar ao trocar de buffer
vim.cmd "set hidden"
vim.cmd "let g:nvim_tree_auto_close = 1" ---fechar quando for ultimo
vim.cmd "let g:nvim_tree_quit_on_open = 1"---fechar ao abrir arquivo
vim.cmd "let g:dashboard_default_executive ='telescope'"---definir telescope como mecanismo na tela inicial
