local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

---gerenciador
-- vim.cmd 'packadd paq-nvim'
return require("packer").startup({
  function()
    use({ -- Speed up loading Lua modules in Neovim to improve startup time.
      "lewis6991/impatient.nvim",
    })
    use("wbthomason/packer.nvim")
    use( --parenteses coloridos
      "p00f/nvim-ts-rainbow"
    )
    use({ -- simbolos no menu
      "onsails/lspkind-nvim",
    })
    use({ -- mover itens selecionados
      "booperlv/nvim-gomove",
      config = function()
        require("gomove").setup({})
      end,
    })

    use({ -- configurar depois
      "kevinhwang91/nvim-hlslens",
      config = function()
        require("hlslens").setup()
      end,
    })
    use({ --configurar depois
      "petertriho/nvim-scrollbar",
      config = function()
        require("scrollbar").setup()
      end,
    })
    use({
      "ray-x/lsp_signature.nvim",
      config = function()
        require("plugins/lsp_signature_config")
      end,
    })
    use({ --mostrar indendação
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("plugins/indent-blankline_config")
      end,
    })
    use({
      "projekt0n/github-nvim-theme",
      config = function()
        require("plugins/github-theme_config").setup()
      end,
    })
    use( --simbolos lsp pro tema
      "folke/lsp-colors.nvim"
    )
    use({ --adicionar/remove/substituir caractes em volta
      "blackCauldron7/surround.nvim",
      config = function()
        require("surround").setup({})
      end,
    })
    use({ --listagem do copiar
      "AckslD/nvim-neoclip.lua",
      config = function()
        require("neoclip").setup({})
      end,
    })
    use({ --mostrar marcas
      "chentau/marks.nvim",
      config = function()
        require("marks").setup({})
      end,
    })
    use({ --comentarios
      "b3nj5m1n/kommentary",
      config = function()
        require("plugins/kommentary_config")
      end,
    })
    use({
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup({})
      end,
    })
    use({
      "nvim-telescope/telescope-file-browser.nvim",
      config = function()
        require("telescope").load_extension("file_browser")
      end,
    })
    use({ -- finder
      --deps : fd, ripgrep
      "nvim-telescope/telescope.nvim",
      requires = {
        { "kyazdani42/nvim-web-devicons" },
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-treesitter/nvim-treesitter" },
      },
    })
    use({ -- notificações
      "rcarriga/nvim-notify",
      config = function()
        require("plugins/nvim-notify_config")
      end,
    })
    use({ --formatador de arquivos
      "mhartington/formatter.nvim",
      ft = { "rust", "python", "c", "lua" },
      config = function()
        require("plugins/formatter_config")
      end,
    })

    use({
      "skywind3000/asyncrun.extra",
      ft = { "cpp", "c", "python", "rust", "go", "dart" },
      requires = {
        { "skywind3000/asyncrun.vim" },
        { "voldikss/vim-floaterm" },
      },
      config = function()
        require("plugins/asyncrun_config")
      end,
    })
    use({ --debug
      "mfussenegger/nvim-dap",
      requires = {
        {
          --- mostrar valores no codigo
          "theHamsta/nvim-dap-virtual-text",
          requires = "nvim-treesitter/nvim-treesitter",
        },
        { "rcarriga/nvim-dap-ui" },
      },
      config = function()
        require("plugins/debugando")
      end,
    })
    use({ --escurecer bloco não atual, n funcionou
      "folke/twilight.nvim",
      config = function()
        require("twilight").setup({})
      end,
    })
    use({ --mostrar combinações de taclas possiveis
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup({})
      end,
    })
    use({ --movimentação suave
      "karb94/neoscroll.nvim",
      config = function()
        require("neoscroll").setup({})
      end,
    })
    use( --lista de variaveis e funções
      "liuchengxu/vista.vim"
    )
    -- simrat39/symbols-outline.nvim
    use({ --janela com erros
      "folke/lsp-trouble.nvim",
      config = function()
        require("trouble").setup()
      end,
    })
    use({ --explorador de arquivos
      "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons",
      },
      config = function()
        require("plugins/nvim-tree_config")
      end,
    })
    use({ --statusline
      "hoob3rt/lualine.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("plugins/lualine_config")
      end,
    })

    use({ --fechar paretes,chaves
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup()
      end,
    })
    use({ --flutter
      "akinsho/flutter-tools.nvim",
      ft = { "dart" },
      requires = {
        { "nvim-lua/plenary.nvim" },
      },
      config = function()
        require("plugins/flutter-tools_config")
      end,
    })
    use({ --rust
      "simrat39/rust-tools.nvim",
      ft = { "rust" },
      requires = {
        "neovim/nvim-lspconfig",
        "nvim-lua/plenary.nvim",
        "mfussenegger/nvim-dap",
      },
      config = function()
        require("plugins/rust-tools_config")
      end,
    })
    -- ; "TimUntersberger/neogit"
    use({
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require("plugins/nvim-treesitter_config")
      end,
    })
    -- use({
    --     -- "shift-d/crates.nvim",
    --     "mhinz/vim-crates",
    --     -- "Saecki/crates.nvim",
    --     event = { "BufRead Cargo.toml" },
    --     config = vim.cmd([[call crates#toggle()]]),
    -- })
    --

    use({ --melhora no uso do lsp(fonte)
      "ray-x/navigator.lua",
      requires = {
        { "neovim/nvim-lspconfig" },
        { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
      },
      config = function()
        require("plugins/navigator_config")
      end,
    })

    use({ --tabs superiores
      "akinsho/nvim-bufferline.lua",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("plugins/bufferline_config")
      end,
    })

    use({
      "echasnovski/mini.nvim",
      branch = "stable",
      config = function()
        require("plugins/mini_nvim_config")
      end,
    })

    -- use({ --configurar completar
    --   "hrsh7th/nvim-cmp",
    --   requires = {
    --     {
    --       "hrsh7th/cmp-nvim-lsp",
    --       requires = "neovim/nvim-lspconfig",
    --     },
    --     "hrsh7th/cmp-path",
    --     "hrsh7th/cmp-buffer",
    --     "hrsh7th/cmp-nvim-lua",
    --     "lukas-reineke/cmp-under-comparator",
    --     {
    --       "hrsh7th/cmp-vsnip",
    --       requires = {
    --         {
    --           "hrsh7th/vim-vsnip", -- motor de snippets
    --           requires = {
    --             "rafamadriz/friendly-snippets", -- snippets(formato json)
    --           },
    --         },
    --       },
    --     },
    --   },
    --   config = function()
    --     require("plugins/cmp_config")
    --   end,
    -- })

    use({ --mostrar coinscidencias do cursor
      "xiyaowong/nvim-cursorword",
    })

    use({ --tela inicial
      "glepnir/dashboard-nvim",
    })

    use({ --mostrar cores
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup()
      end,
    })
    use({ --estabilizar/centralizar buffet quando abre um novo
      "luukvbaal/stabilize.nvim",
      config = function()
        require("stabilize").setup()
      end,
    })
    ---impedir que apagar linha mande elas para o copiar/colar
    -- use({
    --     "gbprod/cutlass.nvim",
    -- })
    if packer_bootstrap then
      require("packer").sync()
    end
  end,

  config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath("config") .. "/plugin/packer_compiled.lua",

    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})
