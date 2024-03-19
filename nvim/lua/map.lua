local opts = { noremap = true, silent = true }
local wk = require("which-key")
vim.api.nvim_set_keymap("n", "<F9>", [[<cmd>lua require'dap'.toggle_breakpoint()<CR>]], opts)
vim.api.nvim_set_keymap("n", "<F10>", [[<cmd>lua require'dap'.step_into()<CR>]], opts)
vim.api.nvim_set_keymap("n", "<F11>", [[<cmd>lua require'dap'.step_over()<CR>]], opts)
vim.api.nvim_set_keymap("n", "<F12>", [[<cmd>lua require'dap'.continue()<CR>]], opts)
vim.api.nvim_set_keymap("n", "<C-f>", [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], opts)
vim.api.nvim_set_keymap("n", "<C-b>", [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], opts)
vim.api.nvim_set_keymap("v", "<space>ca", [[:<c-u>Lspsaga range_code_action<cr>]], opts)
wk.register({
  ["<space>"] = {
    name = "lsp",
    ["D"] = "which_key_ignore",
    w = {
      name = "projetos",
      a = { "adicionar pasta ao projeto" },
      r = { "remover pasto do projeto" },
      l = { "listar pastas do projeto" },
    },
    ff = { "formatar arquivo" },
    c = {
      name = "sugestão de codigo",
      a = { [[<cmd>Lspsaga code_action<CR>]], "code action" },
    },
    k = { [[<cmd>Lspsaga hover_doc<CR>]], "hover" },
    r = { [[<cmd>Lspsaga rename<cr>]], "renomear" },
    b = { [[<cmd>lua require('telescope.builtin').buffers()<cr>]], "buffers" },
  },
  g = {
    name = "LSP",

    d = { [[<cmd>Lspsaga preview_definition<CR>]], "ir definição" },
    p = { "ver definição" },
    ["0"] = { "ver simbolos do arquivos" },
    L = { [[<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>]], "mostrar erros" },
    i = { "ir para implementação" },
    r = { [[<cmd>Lspsaga lsp_finder<CR>]], "references" },
  },
  ["["] = {
    d = { [[<cmd>Lspsaga diagnostic_jump_prev<CR>]], "erro anterior" },
    r = { "referencia anterior" },
  },
  ["]"] = {
    d = { "[[<cmd>Lspsaga diagnostic_jump_next<CR>]],erro posterior" },
    r = { "referencia posterior" },
  },
  ---finder
  ["<leader>"] = {
    name = "telescope",
    f = {
      name = "procurador",
      a = {
        [[<cmd>lua require('telescope.builtin').find_files()<cr>]],
        "arquivos",
      }, ---dep=bat,ripgrep
      b = {
        [[<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>]],
        "arvore de arquivos",
      },
      c = {
        [[<cmd>lua require('telescope').extensions.neoclip.commands()<cr>]],
        "neoclip",
      },
      d = {
        [[<cmd>lua require('telescope.builtin').builtin()<cr>]],
        "menus disponiveis",
      },
      f = {
        [[<cmd>lua require('telescope').extensions.flutter.commands()<cr>]],
        "flutter",
      },
      g = {
        [[<cmd>lua require('telescope.builtin').live_grep()<cr>]],
        "procurar string ",
      },
      h = {
        [[<cmd>lua require('telescope.builtin').help_tags()<cr>]],
        "help_tags",
      },
      t = {
        [[<cmd>lua require('telescope.builtin').treesitter()<cr>]],
        "treesitter",
      },
      p = {
        [[<cmd>lua require('telescope').extensions.projects.commands()<cr>]],
        "projetos",
      },
    },
    g = "which_key_ignore",
    r = "which_key_ignore",
  },
})

---cancelar carecteres selecionados
vim.api.nvim_set_keymap("n", "<ESC>", ":nohlsearch<CR> ", opts)

---copiar colocar, fora do editor
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { silent = true })
vim.api.nvim_set_keymap("v", "<C-x>", '"+x', { silent = true })
-- vim.api.nvim_set_keymap("v","<C-v>","\"+gP",{silent=true})

---explorador de arquivos
vim.api.nvim_set_keymap("n", "<C-n>", ":Neotree float toggle<CR>", {
  noremap = false,
  silent = true,
})
vim.api.nvim_set_keymap("n", "<S-b>", ":Neotree float buffers toggle<CR>", {
  noremap = false,
  silent = true,
})
--trocar aba
-- vim.api.nvim_set_keymap("n", "<Tab>", ":bn<CR>", { noremap = false, silent = true })
-- vim.api.nvim_set_keymap("n", "<S-Tab>", ":bp<CR>", { noremap = false, silent = true })

vim.api.nvim_set_keymap("n", "<C-w>w", ":bd<CR>", { silent = true })

vim.api.nvim_set_keymap("n", "K", "<Nop>", {})
vim.api.nvim_set_keymap("n", "<F5>", [[<cmd> lua executar_fecha()<CR>]], { noremap = true })
vim.api.nvim_set_keymap("n", "<F6>", [[<cmd> lua executar_fica()<CR>]], { noremap = true })
