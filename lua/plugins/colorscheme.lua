return {
  "craftzdog/solarized-osaka.nvim",
  lazy = true,
  priority = 1000,
  opts = function()
    return {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
        comments = {
          italic = true,
        },
      },
      dim_inactive = false,
      sidebars = { "qf", "terminal", "packer", "help", "bufferline", "lualine" },
    }
  end,
}
