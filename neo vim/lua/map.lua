-------LSP-----------------------------------------------------------------
--Set completeopt to have a better completion experience
local opts = { noremap=true, silent=true }
vim.o.completeopt = 'menuone,noselect,noinsert'
vim.api.nvim_set_keymap('v', '<space>ca',[[<cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>]],opts)
vim.api.nvim_set_keymap('n', '<space>ca',[[<cmd>lua require('lspsaga.codeaction').code_action()<CR>]],opts)
vim.api.nvim_set_keymap('i','<c-space>','<cmd>lua vim.lsp.buf.completion()<CR>',opts)
vim.api.nvim_set_keymap('n','<space>d',[[<cmd>lua require'lspsaga.provider'.preview_definition()<CR>]],opts)
vim.api.nvim_set_keymap('n','<space>td','new <cmd>lua vim.lsp.buf.type_definition()<CR>',opts)
vim.api.nvim_set_keymap('n',"?",[[<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]],opts)
vim.api.nvim_set_keymap('n', "<space>r",[[<cmd>lua require('lspsaga.rename').rename()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<space>i', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-k>',[[<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]], opts)
vim.api.nvim_set_keymap('n', "<space>e", [[<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]],opts )
vim.api.nvim_set_keymap('n', "<space>f", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
vim.api.nvim_set_keymap('n', "<space>xi", [[<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>]], opts)
vim.api.nvim_set_keymap('n', "<space>n", [[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>]], opts)
vim.api.nvim_set_keymap('n', "<space>p", [[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>]], opts)

--projeto
vim.api.nvim_set_keymap('n', '<space>pa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>pr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>pl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

vim.api.nvim_set_keymap('n','<C-f>',[[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]],opts)
vim.api.nvim_set_keymap('n','<C-b>',[[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]],opts)

---cancelar carecteres selecionados
vim.api.nvim_set_keymap('n',  '<ESC>', ':nohlsearch<CR> ',opts)

---menu de completar negação tipo vim
vim.api.nvim_set_keymap('i','<C-j>',  'pumvisible() ? "\\<C-n>" : "\\<C-j>"', {expr = true})
vim.api.nvim_set_keymap('i','<C-k>','pumvisible() ? "\\<C-p>" : "\\<C-k>"',  {expr = true})

---mover linhas
vim.cmd 'vnoremap <A-k> :m \'<-2<CR>gv=gv'
vim.cmd 'vnoremap <A-j> :m \'>+1<CR>gv=gv'
vim.api.nvim_set_keymap('n', '<A-k>',':m .-2<CR>==',{noremap=true})
vim.api.nvim_set_keymap('n','<A-j>', ':m .+1<CR>==',{noremap=true})


---explorador de arquivos
vim.api.nvim_set_keymap('n','<C-n>',':NvimTreeToggle<CR>',{noremap=false})

---finder
vim.api.nvim_set_keymap('n',  '<Space><Space>',  '<cmd>lua require(\'telescope.builtin\').find_files()<cr>',  {noremap=true})
