---gerenciador
vim.cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
paq {'savq/paq-nvim', opt=true}   

---parenteses coloridos
paq 'luochen1990/rainbow'

---mostrar indendação
paq 'nathanaelkane/vim-indent-guides'

---
paq 'blackCauldron7/surround.nvim'

---comentarios
paq 'b3nj5m1n/kommentary'

--- finder
paq 'nvim-telescope/telescope.nvim'


--- dependecias de outros q n uso diretamente
paq 'nvim-lua/popup.nvim'
paq 'nvim-lua/plenary.nvim'


---movimentação suave
paq 'karb94/neoscroll.nvim'

---reload e restart
paq 'famiu/nvim-reload'

---lista de variaveis e funções --requisitos{universal-ctags}
paq 'liuchengxu/vista.vim'

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

---dart hilght syntax
paq 'dart-lang/dart-vim-plugin'

-- paq 'TimUntersberger/neogit'
paq 'nvim-treesitter/nvim-treesitter'

---melhora no uso do lsp(fonte)
paq 'glepnir/lspsaga.nvim'

---tabs superiores
paq 'akinsho/nvim-bufferline.lua'

---snippits
paq 'norcalli/snippets.nvim' --motor


---configurar completar
paq 'hrsh7th/nvim-compe'

---mostrar coinscidencias do cursor
-- paq 'yamatsum/nvim-cursorline'
