require("dapui").setup({
sidebar = {
    open_on_start = true,
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.33, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.33 },
      { id = "watches", size = 0.33 },
    },
    -- width = 40,
    position = "left", -- Can be "left" or "right"
  },
})
local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed
  name = "lldb"
}
dap.configurations.rust= {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}
--- c
require'lspconfig'.clangd.setup{
        cmd = { "clangd",
            "--background-index",
            "--clang-tidy",
            "--suggest-missing-includes",
            "--completion-style=detailed",
            "--header-insertion=iwyu"}
}

----- flutter
require("flutter-tools").setup{
  widget_guides = {
    enable = true,
  },
  lsp = {
  }
}
require("telescope").load_extension("flutter")
require('telescope').load_extension('neoclip')
-------rust
require('rust-tools').setup({
})

---python
require'lspconfig'.pylsp.setup{
  enable = true,
  settings = {
    pylsp = {
      configurationSources = {"flake8"},
      plugins = {
        flake8 = {
          enabled = true,
          ignore = {"E203","W503"},
          maxLineLength = 88,
        },
      }
    }
  }
} 
require("formatter").setup {
  filetype = {
    python = {
      function()
        return {exe = "black", args = {"-"}, stdin = true}
      end,
    },
    rust = {
      function()
        return {
          exe = "rustfmt",
          args = {"--edition=2018", "--emit=stdout"},
          stdin = true,
        }
      end,
    },
    c = {
      function()
        return {
          exe = "clang-format",
          args = {'--assume-filename=', vim.api.nvim_buf_get_name(0),'--style=microsoft'},
          stdin = true,
          cwd = vim.fn.expand('%:p:h')
        }
      end
    },
  },
}


---syntax highlight
require('nvim-treesitter.configs').setup{
    highlight={
        enable=true
    },
  rainbow = {
    enable = true,
  }
}

---não ta funcionando
require("twilight").setup{}
---teclas possiveis
require("which-key").setup{}


---movimentação suave
require('neoscroll').setup({
-- mappings = {'<C-u>', '<C-d>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb'}
mappings = {'<C-y>', '<C-e>', 'zt', 'zz', 'zb'}
})

---janela de erros
require("trouble").setup{}

---listagem do copiar
require('neoclip').setup()

--tema
require('github-theme').setup()

--- fechar paretes,chaves
require('nvim-autopairs').setup()

---comentarios
--require('kommentary.config').use_extended_mappings()
require('kommentary.config')
require('kommentary.config').configure_language("default", {
    single_line_comment_string="//",
    prefer_single_line_comments= true,
    use_consistent_indentation= true,
    ignore_whitespace=true,
})

---melhora no lsp
require 'lspsaga'.init_lsp_saga({
  error_sign = "E",
  warn_sign = "W",
  hint_sign = "H",
  infor_sign = "I",
})


---adicionar/remove/substituir caractes em volta
require"surround".setup{}

--barra de status
require('lualine').setup{
        options = {
          theme = 'github',
    }
}


require'compe'.setup{
  preselect = "disable"; 
  source = {
    cal =true;
    path = true;
    buffer = true;
    nvim_lsp = true;
    nvim_lua = true;
	snippets_nvim = true;
    tag = true;
    treesitter = true;
    vsnip = true;
   },
}

---tabs superiores
require'bufferline'.setup{
  options = {
    diagnostics = "nvim_lsp"
  }
}


--icones (nerd fonts)
require'nvim-web-devicons'.setup()


---selecionar opções de completar
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<Down>"
    --elseif vim.fn['vsnip#available'](1) == 1 then
    --    return t "<Plug>(vsnip-expand-or-jump)"
    else
        return vim.fn['compe#complete']()

    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<Up>"
  --  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
--        return t "<Plug>(vsnip-jump-prev)"
    else
        return t "<S-Tab>"
    end
end

vim.api.nvim_set_keymap("i", "<C-j>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-k>", "v:lua.s_tab_complete()", {expr = true})
