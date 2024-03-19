return {
  {
    -- finder
    --deps : fd, ripgrep
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "kyazdani42/nvim-web-devicons" },
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension("flutter")
      require("telescope").load_extension("neoclip")
      require("telescope").load_extension("notify")
      require("telescope").load_extension("file_browser")
    end,
  },

  { -- integração telescope para procurar arquivos
    "nvim-telescope/telescope-file-browser.nvim",
  },
}
