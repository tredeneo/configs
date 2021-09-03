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
--cursor:normal-inserir-visual-comando=linha verical,substituir=linha horizontal
vim.o.guicursor='n-i-v-c:ver100-blinkon1,r:hor100-blinkon0'

---numeros relativos
vim.wo.number = true
vim.wo.relativenumber = true -- same as vim.api.nvim_win_set_option(0, 'number', true)

---pesquisa em tempo real
vim.o.incsearch = true

vim.o.confirm = true
vim.o.ignorecase = true

---tabs configs
vim.bo.ts = 4
vim.bo.sw = 2

vim.o.showtabline = 2
---n pedir pra salvar ao trocar de buffer
vim.o.hidden = true
vim.bo.iskeyword = '@,48-57,192-255'
-- vim.g.hidden = true
---fechar quando for ultimo
vim.g.nvim_tree_auto_close = true
---fechar ao abrir arquivo
vim.g.nvim_tree_quit_on_open = true
---definir telescope como mecanismo na tela inicial
vim.g.dashboard_default_executive = 'telescope'


vim.cmd [[autocmd BufEnter * :TwilightEnable]]
---formatador
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.c,*.py,*.rs FormatWrite
augroup END
]], true)


