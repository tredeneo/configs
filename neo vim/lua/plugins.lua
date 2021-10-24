local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth=1", "https://github.com/savq/paq-nvim.git", install_path })
end

---gerenciador
-- vim.cmd 'packadd paq-nvim'
require("paq")({

    { "savq/paq-nvim", opt = true }, ---parenteses coloridos
    "p00f/nvim-ts-rainbow", ---mostrar indendação
    "lukas-reineke/indent-blankline.nvim", ---tema
    "projekt0n/github-nvim-theme", ---simbolos lsp pro tema
    "folke/lsp-colors.nvim", ---
    "blackCauldron7/surround.nvim", -- ; "scalameta/nvim-metals"
    "AckslD/nvim-neoclip.lua",
    "chentau/marks.nvim", --mostrar marcas
    ---comentarios
    "b3nj5m1n/kommentary",
    "ahmedkhalf/project.nvim",
    --- finder
    "nvim-telescope/telescope.nvim",
    ---formatador de arquivos
    "rcarriga/nvim-notify", -- notificações
    "mhartington/formatter.nvim",
    ---debug
    "skywind3000/asyncrun.extra",
    "skywind3000/asyncrun.vim",
    "voldikss/vim-floaterm",
    "mfussenegger/nvim-dap",
    "theHamsta/nvim-dap-virtual-text", --- mostrar valores no codigo
    "rcarriga/nvim-dap-ui", ---escurecer bloco não atual, n funcionou
    "folke/twilight.nvim", --- dependecias de outros q n uso diretamente
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim", ---mostrar combinações de taclas possiveis
    "folke/which-key.nvim", ---movimentação suave
    "karb94/neoscroll.nvim",
    ---reload e restart, plugin orfão
    --- ; "famiu/nvim-reload"
    ---lista de variaveis e funções
    "liuchengxu/vista.vim",
    -- simrat39/symbols-outline.nvim
    ---janela com erros
    "folke/lsp-trouble.nvim",
    --- icones
    "kyazdani42/nvim-web-devicons",
    -----explorador de arquivos
    "kyazdani42/nvim-tree.lua",
    --statusline
    "hoob3rt/lualine.nvim",
    "neovim/nvim-lspconfig", ---fechar paretes,chaves
    "windwp/nvim-autopairs", ---flutter
    "akinsho/flutter-tools.nvim", ---rust
    "simrat39/rust-tools.nvim", -- ; "TimUntersberger/neogit"
    "nvim-treesitter/nvim-treesitter", ---melhora no uso do lsp(fonte)
    "ray-x/guihua.lua",
    "ray-x/navigator.lua",
    -- "glepnir/lspsaga.nvim",
    ---tabs superiores
    "akinsho/nvim-bufferline.lua", ---snippets(formato json)
    "rafamadriz/friendly-snippets", ---motor de snippets
    "hrsh7th/vim-vsnip", ---configurar completar    -- ; "hrsh7th/nvim-compe"
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-vsnip", ---mostrar coinscidencias do cursor
    "xiyaowong/nvim-cursorword", --tela inicial
    "glepnir/dashboard-nvim",
})
