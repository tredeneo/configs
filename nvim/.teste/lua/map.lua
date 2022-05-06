local opts = { noremap = true, silent = true }

local wk = require("which-key")
vim.api.nvim_set_keymap("n", "<F9>", [[<cmd>lua require'dap'.toggle_breakpoint()<CR>]], opts)
vim.api.nvim_set_keymap("n", "<F10>", [[<cmd>lua require'dap'.step_into()<CR>]], opts)
vim.api.nvim_set_keymap("n", "<F11>", [[<cmd>lua require'dap'.step_over()<CR>]], opts)
vim.api.nvim_set_keymap("n", "<F12>", [[<cmd>lua require'dap'.continue()<CR>]], opts)
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
      a = { "sugestão de codigo" },
    },
  },
  g = {
    name = "atalhos LSP",

    d = { "ir definição" },
    p = { "ver definição" },
    r = { "ver renomear" },
    ["0"] = { "ver simbolos do arquivos" },
    L = { "mostrar erros" },
    i = { "ir para implementação" },
  },
  ["["] = {
    d = { "erro anterior" },
    r = { "referencia anterior" },
  },
  ["]"] = {
    d = { "erro posterior" },
    r = { "referencia posterior" },
  },
  ---finder
  ["<leader>"] = {
    name = "telescope",
    f = {
      name = "procurador",
      a = { [[<cmd>lua require('telescope.builtin').find_files()<cr>]], "arquivos  (diretorio atual)" }, ---dep=bat,ripgrep
      g = { [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], "procurar string no diretorio atual" },
      b = { [[<cmd>lua require('telescope.builtin').buffers()<cr>]], "buffers" },
      h = { [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], "help_tags" },
      b = {
        [[<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>]],
        "arquivos e pastas  (diretorio atual)",
      },
      f = { [[<cmd>lua require('telescope').extensions.flutter.commands()<cr>]], "flutter" },
      t = { [[<cmd>lua require('telescope.builtin').treesitter()<cr>]], "treesitter" },
      c = { [[<cmd>lua require('telescope').extensions.neoclip.commands()<cr>]], "neoclip" },
      p = { [[<cmd>lua require('telescope').extensions.projects.commands()<cr>]], "projetos" },
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
vim.api.nvim_set_keymap("n", "<C-n>", [[<cmd> lua require'nvim-tree'.toggle()<CR>]], {
  noremap = false,
  silent = true,
})

---trocar aba
vim.api.nvim_set_keymap("n", "<Tab>", ":bn<CR>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bp<CR>", { noremap = false, silent = true })

vim.api.nvim_set_keymap("n", "<C-w>w", ":bd<CR>", { silent = true })

vim.api.nvim_set_keymap("n", "<F5>", [[<cmd> lua executar_fecha()<CR>]], { noremap = true })
vim.api.nvim_set_keymap("n", "<F6>", [[<cmd> lua executar_fica()<CR>]], { noremap = true })
