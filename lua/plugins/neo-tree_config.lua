vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return { --arvore de arquivos
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = {
    buffers = {
      follow_current_file = true,
    },
  }
}
