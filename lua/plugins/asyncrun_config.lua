return { -- executar arquivos
  "skywind3000/asyncrun.extra",
  dependencies = {
    { "skywind3000/asyncrun.vim" },
    { "voldikss/vim-floaterm" },
  },
  config = function()
    function executar_fecha()
      print("vim.bo.filetype")
      if vim.bo.filetype == "python" then
        vim.api.nvim_command([[AsyncRun! -mode=term -pos=floaterm python3 %]])
      elseif vim.bo.filetype == "c" then
        vim.api.nvim_command([[AsyncRun! -mode=term -pos=floaterm clang -std=c99 % -o %<;./%<]])
      elseif vim.bo.filetype == "go" then
        vim.api.nvim_command([[AsyncRun! -mode=term -pos=floaterm go run %]])
      elseif vim.bo.filetype == "rust" then
        vim.api.nvim_command([[AsyncRun! -mode=term -pos=floaterm cargo run %]])
        -- vim.api.nvim_command([[AsyncRun! -mode=term -pos=floaterm cargo run --manifest-path <root>/Cargo.toml]])
      elseif vim.bo.filetype == "nix" then
        vim.api.nvim_command([[AsyncRun! -mode=term -pos=floaterm home-manager switch]])
      elseif vim.bo.filetype == "fsharp" then
        vim.api.nvim_command([[AsyncRun! -mode=term -pos=floaterm dotnet run <root>]])
      end
    end

    function executar_fica()
      if vim.bo.filetype == "c" then
        vim.api.nvim_command([[AsyncRun! -pos=right clang -std=c99 % -o %<;./%<]])
      elseif vim.bo.filetype == "python" then
        vim.api.nvim_command([[AsyncRun! -pos=right python3 %]])
      end
    end

    function makefile()
      if vim.bo.filetype == "c" then
        vim.api.nvim_command([[AsyncRun! make -C %:p:h;time make rodar -C %:p:h]])
      end
    end

    vim.cmd("let g:asyncrun_open = 15")
  end,
}
