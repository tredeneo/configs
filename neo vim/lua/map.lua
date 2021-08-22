-------LSP-----------------------------------------------------------------

--Set completeopt to have a better completion experience
local opts = { noremap=true, silent=true }
  local wk = require("which-key")
vim.o.completeopt = 'menuone,noselect,noinsert'
-- vim.api.nvim_set_keymap('i','<CR>',[[lua vim.fn['compe#confirm']()]],{expr=true,silent=true,noremap=true}) ]]
vim.cmd "inoremap <silent><expr> <C-Space> compe#complete()"
vim.cmd "inoremap <silent><expr> <CR>      compe#confirm('<CR>')"
---usando saga
vim.api.nvim_set_keymap('n',"?",[[<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]],opts)
vim.api.nvim_set_keymap('v', '<space>ca',[[<cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>]],opts)
vim.api.nvim_set_keymap('n','<C-f>',[[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]],opts)
vim.api.nvim_set_keymap('n','<C-b>',[[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]],opts)

vim.api.nvim_set_keymap('n','<F9>',[[<cmd>lua require'dap'.toggle_breakpoint()<CR>]],opts)
vim.api.nvim_set_keymap('n','<F10>',[[<cmd>lua require'dap'.step_into()<CR>]],opts)
vim.api.nvim_set_keymap('n','<F11>',[[<cmd>lua require'dap'.step_over()<CR>]],opts)
vim.api.nvim_set_keymap('n','<F12>',[[<cmd>lua require'dap'.continue()<CR>]],opts)
wk.register({
  ["<space>"]={
    name = "lsp",
    x = {
      name = "erros",
      i = {[[<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>]], "mostrar erros da linha",},
      n = {[[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>]],"ir para o proximo erro" ,},
      p = {[[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>]], "ir para o erro anterior",},
    },
    r = {[[<cmd>lua require('lspsaga.rename').rename()<CR>]],"renomear variavel", },
    p = {
      name = "projetos" ,
      a = {[[<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>]],"adicionar pasta ao projeto"},
      r = {[[<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>]],"remover pasto do projeto"},
      l = {[[<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>]],"listar pastas do projeto"},
    },
    a = {[[<cmd>lua require('lspsaga.codeaction').code_action()<CR>]], "sugestão de codigo"},
    f = { [[<cmd>lua vim.lsp.buf.formatting()<cr>]],"formatar arquivo"},
    e = {[[<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]],"ir referencias"},
    d = {[[<cmd>lua require'lspsaga.provider'.preview_definition()<CR>]],"ver definição"},
    td = {[[new <cmd>lua vim.lsp.buf.type_definition()<CR>]]},
    i = {[[<cmd>lua vim.lsp.buf.implementation()<CR>]]},
  },
  ---finder
  ["<leader>"]={
	name = "telescope",
    f = {
      name = "procurador",
      a = {[[<cmd>lua require('telescope.builtin').find_files()<cr>]],"arquivos  (diretorio atual)"},---dep=bat,ripgrep
      g = {[[<cmd>lua require('telescope.builtin').live_grep()<cr>]],"procurar string no diretorio atual"},
      b = {[[<cmd>lua require('telescope.builtin').buffers()<cr>]],"buffers"},
      h = {[[<cmd>lua require('telescope.builtin').help_tags()<cr>]],"help_tags"},
      p = {[[<cmd>lua require('telescope.builtin').file_browser()<cr>]],"arquivos e pastas  (diretorio atual)"},
      f = {[[<cmd>lua require('telescope').extensions.flutter.commands()<cr>]],"flutter"},
      t = {[[<cmd>lua require('telescope.builtin').treesitter()<cr>]],"treesitter"},
      c = {[[<cmd>lua require('telescope').extensions.neoclip.commands()<cr>]],"neoclip"},
    }
  }
})

---cancelar carecteres selecionados
vim.api.nvim_set_keymap('n',  '<ESC>', ':nohlsearch<CR> ',opts)

---copiar colocar, fora do editor
vim.api.nvim_set_keymap("v","<C-c>","\"+y",{silent=true})
vim.api.nvim_set_keymap("v","<C-x>","\"+x",{silent=true})
-- vim.api.nvim_set_keymap("v","<C-v>","\"+gP",{silent=true})
---mover linhas
vim.cmd 'vnoremap <A-k> :m \'<-2<CR>gv=gv'
vim.cmd 'vnoremap <A-j> :m \'>+1<CR>gv=gv'
vim.api.nvim_set_keymap('n', '<A-k>',':m .-2<CR>==',opts)
vim.api.nvim_set_keymap('n','<A-j>', ':m .+1<CR>==',opts)


---explorador de arquivos
vim.api.nvim_set_keymap('n','<C-n>',':NvimTreeToggle<CR>',{noremap=false,silent=true})



---trocar aba
vim.api.nvim_set_keymap('n','<Tab>',':bn<CR>',{noremap=false,silent=true})
vim.api.nvim_set_keymap('n','<S-Tab>',':bp<CR>',{noremap=false,silent=true})

vim.api.nvim_set_keymap('n','<C-w>w',':bd<CR>',{silent=true})

vim.api.nvim_set_keymap('n','<F5>',[[<cmd> lua executar_arquivo()<CR>]],{noremap=true})
vim.api.nvim_set_keymap('n','<F6>',[[<cmd> lua compilar_projeto()<CR>]],{noremap=true})
vim.api.nvim_set_keymap('t','<C-w>t',[[<cmd> lua require('lspsaga.floaterm').close_float_terminal()<cr>]],{noremap=false})
