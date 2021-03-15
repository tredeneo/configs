---gerenciador
vim.cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
paq {'savq/paq-nvim', opt=true}   

---parenteses coloridos
paq 'luochen1990/rainbow'
-- paq 'p00f/nvim-ts-rainbow' --alternativa em lua

---mostrar indendação
paq 'nathanaelkane/vim-indent-guides'
-- paq 'glepnir/indent-guides.nvim' --alternativa em lua

---
paq 'blackCauldron7/surround.nvim'

---comentarios
paq 'b3nj5m1n/kommentary'

--- finder
paq 'nvim-telescope/telescope.nvim'


--- dependecias de outros q n uso diretamente
paq 'nvim-lua/popup.nvim'
paq 'nvim-lua/plenary.nvim'


--- icones
paq 'kyazdani42/nvim-web-devicons' 

-----explorador de arquivos
paq 'kyazdani42/nvim-tree.lua'

---statusline
paq 'hoob3rt/lualine.nvim'


paq 'neovim/nvim-lspconfig'
paq 'nvim-lua/completion-nvim'

---fechar paretes,chaves
paq 'windwp/nvim-autopairs'

---flutter
paq 'akinsho/flutter-tools.nvim'

---dart hilght syntax
paq 'dart-lang/dart-vim-plugin'

-- paq 'TimUntersberger/neogit'
paq 'nvim-treesitter/nvim-treesitter'

---melhora no uso do lsp
paq 'glepnir/lspsaga.nvim'

---sinalização da ação de codigo
-- paq 'kosayoda/nvim-lightbulb'
