---comentarios
--require('kommentary.config').use_extended_mappings()

return { --comentarios
  "b3nj5m1n/kommentary",
  config = function()
    require("kommentary.config")
    require("kommentary.config").configure_language("default", {
      single_line_comment_string = "//",
      prefer_single_line_comments = true,
      use_consistent_indentation = true,
      ignore_whitespace = true,
    })
    require("kommentary.config").configure_language("fsharp", {
      single_line_comment_string = "//",
      multi_line_comment_string = { "(*", "*)" },
      prefer_single_line_comments = true,
      use_consistent_indentation = true,
      ignore_whitespace = true,
    })
  end,
}
