--async compilar
local function executar(argumentos)
  require('lspsaga.floaterm').open_float_terminal(argumentos,3)
end

function executar_arquivo()
  local nome_com_caminho = vim.api.nvim_exec([[echo expand('%:p')]],true) 
  local nome = vim.api.nvim_exec([[echo expand('%:r')]],true)
  local caminho = vim.api.nvim_exec([[echo expand('%:h')]],true)
  if vim.bo.filetype == 'lua' then
    print('lua')
  elseif vim.bo.filetype == 'c' then
    executar('clang '..nome_com_caminho..' -o '..nome..' && '..caminho..'/'..nome)
  elseif vim.bo.filetype == 'rust' then
    executar('rustc '..nome_com_caminho..' && '..nome)
  elseif vim.bo.filetype == 'python' then
    executar('python3 '..nome_com_caminho)
  end
end

function compilar_projeto()
  local caminho = vim.api.nvim_exec([[echo expand('%:h')]],true)
  if vim.bo.filetype == 'rust' then
    executar('echo (cd'..caminho..':cargo build)')
  end
end

function executar_projeto(car)
  local caminho = vim.api.nvim_exec([[echo expand('%:h')]],true)
  if vim.bo.filetype == 'rust' then
    executar('echo (cd '..caminho..';cargo run)')
  end
end
  



