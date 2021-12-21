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
return require("packer").startup(function()
    use("wbthomason/packer.nvim")
    ---parenteses coloridos
    use("p00f/nvim-ts-rainbow")
    use("ray-x/lsp_signature.nvim")
    ---mostrar indendação
    use("lukas-reineke/indent-blankline.nvim")
    ---tema
    use("projekt0n/github-nvim-theme")
    ---simbolos lsp pro tema
    use("folke/lsp-colors.nvim")
    ---
    use("blackCauldron7/surround.nvim")
    --
    use("AckslD/nvim-neoclip.lua")
    ---mostrar marcas
    use("chentau/marks.nvim")
    ---comentarios
    use("b3nj5m1n/kommentary")
    use("ahmedkhalf/project.nvim")
    --- finder
    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    ---formatador de arquivos
    use("rcarriga/nvim-notify")
    -- notificações
    use("mhartington/formatter.nvim")
    ---debug
    use({
        "skywind3000/asyncrun.extra",
        requires = {
            { "skywind3000/asyncrun.vim" },
            { "voldikss/vim-floaterm" },
        },
    })
    use("mfussenegger/nvim-dap")
    --- mostrar valores no codigo
    use("theHamsta/nvim-dap-virtual-text")
    use("rcarriga/nvim-dap-ui")
    ---escurecer bloco não atual, n funcionou
    use("folke/twilight.nvim")
    --- dependecias de outros q n uso diretamente
    use("nvim-lua/popup.nvim")
    use("nvim-lua/plenary.nvim")
    ---mostrar combinações de taclas possiveis
    use("folke/which-key.nvim")
    ---movimentação suave
    use("karb94/neoscroll.nvim")
    ---reload e restart, plugin orfão
    --- ; "famiu/nvim-reload"
    ---lista de variaveis e funções
    use("liuchengxu/vista.vim")
    -- simrat39/symbols-outline.nvim
    ---janela com erros
    use("folke/lsp-trouble.nvim")
    --- icones
    use("kyazdani42/nvim-web-devicons")
    -----explorador de arquivos
    use("kyazdani42/nvim-tree.lua")
    --statusline
    use("hoob3rt/lualine.nvim")
    use("neovim/nvim-lspconfig")
    ---fechar paretes,chaves
    use("windwp/nvim-autopairs")
    ---flutter
    use("akinsho/flutter-tools.nvim")
    ---rust
    use("simrat39/rust-tools.nvim")
    -- ; "TimUntersberger/neogit"
    use("nvim-treesitter/nvim-treesitter")
    ---melhora no uso do lsp(fonte)
    use({ "ray-x/navigator.lua", requires = { "ray-x/guihua.lua", run = "cd lua/fzy && make" } })
    -- "glepnir/lspsaga.nvim",
    ---tabs superiores
    use("akinsho/nvim-bufferline.lua")
    ---snippets(formato json)
    use("rafamadriz/friendly-snippets")
    ---motor de snippets
    use("hrsh7th/vim-vsnip")
    ---configurar completar
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-vsnip")
    ---mostrar coinscidencias do cursor
    use("xiyaowong/nvim-cursorword")
    --tela inicial
    use("glepnir/dashboard-nvim")
    --estabilizar/centralizar buffet quando abre um novo
    use("luukvbaal/stabilize.nvim")
    ---impedir que apagar linha mande elas para o copiar/colar
    -- use({
    --     "gbprod/cutlass.nvim",
    -- })
    if packer_bootstrap then
        require("packer").sync()
    end
end)
-- require("paq")({

--     { "savq/paq-nvim", opt = true }, ---parenteses coloridos
--     "p00f/nvim-ts-rainbow", ---mostrar indendação
--     "lukas-reineke/indent-blankline.nvim", ---tema
--     "projekt0n/github-nvim-theme", ---simbolos lsp pro tema
--     "folke/lsp-colors.nvim", ---
--     "blackCauldron7/surround.nvim", -- ; "scalameta/nvim-metals"
--     "AckslD/nvim-neoclip.lua",
--     "chentau/marks.nvim", --mostrar marcas
--     ---comentarios
--     "b3nj5m1n/kommentary",
--     "ahmedkhalf/project.nvim",
--     --- finder
--     "nvim-telescope/telescope.nvim",
--     ---formatador de arquivos
--     "rcarriga/nvim-notify", -- notificações
--     "mhartington/formatter.nvim",
--     ---debug
--     "skywind3000/asyncrun.extra",
--     "skywind3000/asyncrun.vim",
--     "voldikss/vim-floaterm",
--     "mfussenegger/nvim-dap",
--     "theHamsta/nvim-dap-virtual-text", --- mostrar valores no codigo
--     "rcarriga/nvim-dap-ui", ---escurecer bloco não atual, n funcionou
--     "folke/twilight.nvim", --- dependecias de outros q n uso diretamente
--     "nvim-lua/popup.nvim",
--     "nvim-lua/plenary.nvim", ---mostrar combinações de taclas possiveis
--     "folke/which-key.nvim", ---movimentação suave
--     "karb94/neoscroll.nvim",
--     ---reload e restart, plugin orfão
--     --- ; "famiu/nvim-reload"
--     ---lista de variaveis e funções
--     "liuchengxu/vista.vim",
--     -- simrat39/symbols-outline.nvim
--     ---janela com erros
--     "folke/lsp-trouble.nvim",
--     --- icones
--     "kyazdani42/nvim-web-devicons",
--     -----explorador de arquivos
--     "kyazdani42/nvim-tree.lua",
--     --statusline
--     "hoob3rt/lualine.nvim",
--     "neovim/nvim-lspconfig", ---fechar paretes,chaves
--     "windwp/nvim-autopairs", ---flutter
--     "akinsho/flutter-tools.nvim", ---rust
--     "simrat39/rust-tools.nvim", -- ; "TimUntersberger/neogit"
--     "nvim-treesitter/nvim-treesitter", ---melhora no uso do lsp(fonte)
--     "ray-x/guihua.lua",
--     "ray-x/navigator.lua",
--     -- "glepnir/lspsaga.nvim",
--     ---tabs superiores
--     "akinsho/nvim-bufferline.lua", ---snippets(formato json)
--     "rafamadriz/friendly-snippets", ---motor de snippets
--     "hrsh7th/vim-vsnip", ---configurar completar    -- ; "hrsh7th/nvim-compe"
--     "hrsh7th/nvim-cmp",
--     "hrsh7th/cmp-path",
--     "hrsh7th/cmp-nvim-lsp",
--     "hrsh7th/cmp-buffer",
--     "hrsh7th/cmp-vsnip", ---mostrar coinscidencias do cursor
--     "xiyaowong/nvim-cursorword", --tela inicial
--     "glepnir/dashboard-nvim",
--     "luukvbaal/stabilize.nvim", --estabilizar/centralizar buffet quando abre um novo
-- })
