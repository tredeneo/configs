---outros arquivos
vim.lsp.set_log_level("debug")
require("plugins")
require("map")
require("lsp")
require("requires")
require("execut")
require("debugando")

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
vim.o.guicursor = "n-i-v-c:ver100-blinkon1,r:hor100-blinkon0"

vim.o.completeopt = "menuone,noselect,noinsert"
---numeros relativos
vim.wo.number = true
vim.wo.relativenumber = true -- same as vim.api.nvim_win_set_option(0, 'number', true)

vim.o.confirm = true
vim.o.ignorecase = true

---tabs configs
-- mostra TAB existente com 4 espaços
vim.bo.tabstop = 4
-- quando indentado com '>',usa 4 espaços
vim.bo.shiftwidth = 4
-- quando apertar TAB, inseri 4 espaços
vim.bo.expandtab = true

vim.o.showtabline = 2
---n pedir pra salvar ao trocar de buffer
vim.o.hidden = true
vim.bo.iskeyword = "@,48-57,192-255"
-- vim.g.hidden = true

---definir telescope como mecanismo na tela inicial
vim.g.dashboard_default_executive = "telescope"
--mostrar valores no codigo durante o debug
vim.opt.shell = "/bin/bash"
-- vim.g.dap_virtual_text = true
vim.notify = require("notify")
-- vim.cmd [[autocmd BufEnter * :TwilightEnable]]
---formatador
vim.api.nvim_exec(
    [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.c,*.py,*.rs,*.lua FormatWrite
augroup END
]],
    true
)
