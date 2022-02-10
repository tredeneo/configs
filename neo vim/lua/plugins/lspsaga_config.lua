require("lspsaga").setup({})

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "K", [[<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]], opts)
vim.api.nvim_set_keymap("n", "<C-f>", [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], opts)
vim.api.nvim_set_keymap("n", "<C-b>", [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], opts)
vim.api.nvim_set_keymap("n", "<leader>ca", [[<cmd>lua require('lspsaga.codeaction').code_action()<CR>]], opts)
vim.api.nvim_set_keymap("v", "<leader>ca", [[:<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>]], opts)
vim.api.nvim_set_keymap("n", "gr", [[<cmd>lua require('lspsaga.rename').rename()<CR>]], opts)
vim.api.nvim_set_keymap("n", "gd", [[<cmd>lua require'lspsaga.provider'.preview_definition()<CR>]], opts)
vim.api.nvim_set_keymap("n", "gL", [[<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>]], opts)
