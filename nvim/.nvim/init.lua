---outros arquivos
vim.opt.termguicolors = true
vim.notify = require("notify")
-- vim.lsp.set_log_level("debug")
require("impatient")
require("plugins/packer_config")
require("map")
require("requires")

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

---numeros relativos
vim.wo.number = true
vim.wo.relativenumber = true

vim.o.confirm = true
vim.o.ignorecase = true
vim.cmd("set clipboard+=unnamedplus")

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
-- vim.cmd [[autocmd BufEnter * :TwilightEnable]]
