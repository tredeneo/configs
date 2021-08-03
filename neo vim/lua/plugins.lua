---gerenciador
vim.cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
paq {'savq/paq-nvim', opt=true}   

---parenteses coloridos
paq 'luochen1990/rainbow'

---mostrar indendação
paq 'lukas-reineke/indent-blankline.nvim'

---
paq 'blackCauldron7/surround.nvim'

---comentarios
paq 'b3nj5m1n/kommentary'

--- finder
paq 'nvim-telescope/telescope.nvim'

---escurecer bloco não atual, n funcionou
paq 'folke/twilight.nvim'
--- dependecias de outros q n uso diretamente
paq 'nvim-lua/popup.nvim'
paq 'nvim-lua/plenary.nvim'

---mostrar combinações de taclas possiveis
paq 'folke/which-key.nvim'

---movimentação suave
paq 'karb94/neoscroll.nvim'

---reload e restart, plugin orfão
-- paq 'famiu/nvim-reload'

---lista de variaveis e funções
paq 'liuchengxu/vista.vim'
-- simrat39/symbols-outline.nvim

---janela com erros
paq 'folke/lsp-trouble.nvim'

--- icones
paq 'kyazdani42/nvim-web-devicons' 

-----explorador de arquivos
paq 'kyazdani42/nvim-tree.lua'

---statusline
paq 'hoob3rt/lualine.nvim'

paq 'neovim/nvim-lspconfig'

---fechar paretes,chaves
paq 'windwp/nvim-autopairs'

---flutter
paq 'akinsho/flutter-tools.nvim'

---dart highlight syntax
paq 'dart-lang/dart-vim-plugin'

---rust
paq 'simrat39/rust-tools.nvim'

-- paq 'TimUntersberger/neogit'
paq 'nvim-treesitter/nvim-treesitter'

---melhora no uso do lsp(fonte)
paq 'glepnir/lspsaga.nvim'

---tabs superiores
paq 'akinsho/nvim-bufferline.lua'

---motor de snippets 
paq 'norcalli/snippets.nvim'

---configurar completar
paq 'hrsh7th/nvim-compe'

---mostrar coinscidencias do cursor
paq 'xiyaowong/nvim-cursorword'

--tela inicial
paq 'glepnir/dashboard-nvim'
