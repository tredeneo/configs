-- autocmd BufWritePost *.fs,*.lua FormatWrite
vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.fs FormatWrite
augroup END
]] ,
  true
)

return { --formatador de arquivos
  "mhartington/formatter.nvim",
  config = {
    filetype = {
      fsharp = {
        function()
          return {
            exe = "fantomas",
            args = { vim.api.nvim_buf_get_name(0), "--stdout" },
            stdin = true,
          }
        end,
      },
    },
  } }
