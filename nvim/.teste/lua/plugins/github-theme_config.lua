require("github-theme").setup({
  theme_style = "dimmed",

  -- dark_float = true,
  overrides = function(c)
    return {
      NormalFloat = { link = "PmenuThumb" },
      --FloatBorder, ver depois
    }
  end,
})
