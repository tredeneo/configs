return {
  { "tpope/vim-surround" },
  { "alvan/vim-closetag" },

  { "ray-x/go.nvim", ft = "go" },
  { -- animação carregamento do LSP
    "j-hui/fidget.nvim",
    config = true,
  },
  { -- mostrar numero da linha na inserção
    "nkakouros-original/numbers.nvim",
    config = true,
  },
  { --parenteses coloridos
    "p00f/nvim-ts-rainbow",
  },
  { -- realçar argumentos da função
    "m-demare/hlargs.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
  },
  {
    "haringsrob/nvim_context_vt",
  },
  {
    "anuvyklack/fold-preview.nvim",
    dependencies = "anuvyklack/keymap-amend.nvim",
    config = true,
    event = "VeryLazy",
  },
  { -- fsharp syntax highlight
    "PhilT/vim-fsharp",
  },
  { -- simbolos no menu
    "onsails/lspkind-nvim",
    event = "VeryLazy",
  },
  { -- mover itens selecionados
    "booperlv/nvim-gomove",
    config = true,
  },

  { -- realçar itens pesquisados
    "kevinhwang91/nvim-hlslens",
    config = true,
  },

  { --simbolos lsp pro tema
    "folke/lsp-colors.nvim",
  },
  { --listagem do copiar
    "AckslD/nvim-neoclip.lua",
    config = true,
  },
  { --mostrar marcas
    "chentoast/marks.nvim",
    config = true,
    event = "VeryLazy",
  },
  { --escurecer bloco não atual
    "folke/twilight.nvim",
    config = true,
  },
  { --mostrar combinações de teclas possiveis
    "folke/which-key.nvim",
    config = true,
    event = "VeryLazy",
  },
  { --movimentação suave
    "karb94/neoscroll.nvim",
    config = true,
  },
  { --lista de variaveis e funções
    "liuchengxu/vista.vim",
  },
  { -- simrat39/symbols-outline.nvim
    "simrat39/symbols-outline.nvim",
  },
  { --janela com erros
    "folke/lsp-trouble.nvim",
    config = true,
    event = "VeryLazy",
  },

  { --fechar paretes,chaves
    "windwp/nvim-autopairs",
    config = true,
  },
  { -- mostrar tipos no codigo
    "jubnzv/virtual-types.nvim",
  },

  {
    "nmac427/guess-indent.nvim",
    config = true,
  },

  { --mostrar coinscidencias do cursor
    "xiyaowong/nvim-cursorword",
  },

  { --tela inicial
    "glepnir/dashboard-nvim",
  },

  { --mostrar cores hexa
    "norcalli/nvim-colorizer.lua",
    config = {
      css = { rgb_fn = true },
    },
  },
  { --estabilizar/centralizar buffet quando abre um novo
    "luukvbaal/stabilize.nvim",
    config = true,
  },
}
