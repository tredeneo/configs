-------LSP-----------------------------------------------------------------
--Set completeopt to have a better completion experience
local opts = { noremap=true, silent=true }
vim.o.completeopt = 'menuone,noselect,noinsert'
vim.api.nvim_set_keymap('i','<C-space>',[[lua vim.fn['compe#complete']()]],{expr=true,silent=true,noremap=true})
vim.api.nvim_set_keymap('n','<space>td','new <cmd>lua vim.lsp.buf.type_definition()<CR>',opts)
vim.api.nvim_set_keymap('n', '<space>i', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', "<space>f", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)

---usando saga
vim.api.nvim_set_keymap('n',"?",[[<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]],opts)
vim.api.nvim_set_keymap('n', "<space>xi", [[<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<space>ca',[[<cmd>lua require('lspsaga.codeaction').code_action()<CR>]],opts)
vim.api.nvim_set_keymap('v', '<space>ca',[[<cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>]],opts)
vim.api.nvim_set_keymap('n','<space>d',[[<cmd>lua require'lspsaga.provider'.preview_definition()<CR>]],opts)
vim.api.nvim_set_keymap('n', "<space>e", [[<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]],opts )
vim.api.nvim_set_keymap('n', "<space>r",[[<cmd>lua require('lspsaga.rename').rename()<CR>]], opts)
vim.api.nvim_set_keymap('n', "<space>n", [[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>]], opts)
vim.api.nvim_set_keymap('n', "<space>p", [[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>]], opts)
vim.api.nvim_set_keymap('n','<C-f>',[[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]],opts)
vim.api.nvim_set_keymap('n','<C-b>',[[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]],opts)

--projeto
vim.api.nvim_set_keymap('n', '<space>pa', [[<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<space>pr', [[<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<space>pl', [[<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>]], opts)

---cancelar carecteres selecionados
vim.api.nvim_set_keymap('n',  '<ESC>', ':nohlsearch<CR> ',opts)

---copiar colocar, fora do editor
vim.api.nvim_set_keymap("v","<C-c>","\"+y",{silent=true})
vim.api.nvim_set_keymap("v","<C-x>","\"+x",{silent=true})
vim.api.nvim_set_keymap("v","<C-v>","\"+gP",{silent=true})
---mover linhas
vim.cmd 'vnoremap <A-k> :m \'<-2<CR>gv=gv'
vim.cmd 'vnoremap <A-j> :m \'>+1<CR>gv=gv'
vim.api.nvim_set_keymap('n', '<A-k>',':m .-2<CR>==',opts)
vim.api.nvim_set_keymap('n','<A-j>', ':m .+1<CR>==',opts)


---explorador de arquivos
vim.api.nvim_set_keymap('n','<C-n>',':NvimTreeToggle<CR>',{noremap=false,silent=true})
---finder
vim.api.nvim_set_keymap('n','<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<cr>]],{noremap=true})
vim.api.nvim_set_keymap('n','<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]],{noremap=true})
vim.api.nvim_set_keymap('n','<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]],{noremap=true})
vim.api.nvim_set_keymap('n','<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]],{noremap=true})
vim.api.nvim_set_keymap('n','<leader>fp', [[<cmd>lua require('telescope.builtin').file_browser()<cr>]],{noremap=true})

---trocar aba
vim.api.nvim_set_keymap('n','<Tab>',':bn<CR>',{noremap=false,silent=true})
vim.api.nvim_set_keymap('n','<S-Tab>',':bp<CR>',{noremap=false,silent=true})

vim.api.nvim_set_keymap('n','<C-w>w',':bd<CR>',{silent=true})

vim.api.nvim_set_keymap('n','<F5>',[[<cmd> lua executar_arquivo()<CR>]],{noremap=true})
vim.api.nvim_set_keymap('n','<F6>',[[<cmd> lua compilar_projeto()<CR>]],{noremap=true})
vim.api.nvim_set_keymap('t','<C-w>t',[[<cmd> lua require('lspsaga.floaterm').close_float_terminal()<cr>]],{noremap=false})
