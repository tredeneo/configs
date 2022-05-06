vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.fs,*.c,*.py,*.rs,*.lua FormatWrite
augroup END
]],
  true
)
require("formatter").setup({
  filetype = {
    python = {
      function()
        return { exe = "black", args = { "-" }, stdin = true }
      end,
    },
    rust = {
      function()
        return {
          exe = "rustfmt",
          args = { "--edition=2021", "--emit=stdout" },
          stdin = true,
        }
      end,
    },
    c = {
      function()
        return {
          exe = "clang-format",
          args = { "--assume-filename=", vim.api.nvim_buf_get_name(0), "--style=microsoft" },
          stdin = true,
          -- cwd = vim.fn.expand("%:p:h"),
        }
      end,
    },
    lua = {
      function()
        return {
          exe = "stylua",
          args = { "-", "--indent-type Spaces", "--indent-width 2" },
          stdin = true,
        }
      end,
    },
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
})
