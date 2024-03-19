return {
  -- tema
  "projekt0n/github-nvim-theme",
  lazy = false,
  priority = 1000,
  config = function()
    require("github-theme").setup({
      theme_style = "dimmed",

      -- dark_float = true,
      overrides = function()
        return {
          NormalFloat = { link = "PmenuThumb" },
          --FloatBorder, ver depois
        }
      end
    })
  end
}
