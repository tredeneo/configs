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
-- require('indent_guides').setup()

---
paq 'blackCauldron7/surround.nvim'
require'surround'.setup{}

---comentarios
paq 'b3nj5m1n/kommentary'

--- finder
paq 'nvim-telescope/telescope.nvim'


paq 'nvim-lua/popup.nvim'
paq 'nvim-lua/plenary.nvim'


--- icones
paq 'kyazdani42/nvim-web-devicons' 

-----explorador de arquivos
paq 'kyazdani42/nvim-tree.lua'

---statusline
paq 'hoob3rt/lualine.nvim'
require('lualine').status{
        options = {
          theme = 'gruvbox',
    }
}

paq 'nvim-lua/lsp_extensions.nvim'
paq 'neovim/nvim-lspconfig'
paq 'nvim-lua/completion-nvim'

---fechar paretes,chaves
paq 'windwp/nvim-autopairs'


---flutter
paq 'akinsho/flutter-tools.nvim'

-- paq 'TimUntersberger/neogit'

paq 'nvim-treesitter/nvim-treesitter'
