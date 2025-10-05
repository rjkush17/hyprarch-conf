return {
  "olimorris/onedarkpro.nvim",
  lazy = false,    -- Load immediately
  priority = 1000, -- Ensure it loads before other themes
  config = function()
    require("onedarkpro").setup({
      colors = {}, -- Override colors if needed
      highlights = {
        keywords = { style = "bold" },
        strings = { style = "italic" },
        functions = { style = "italic" }
      },
      options = {
        transparency = true, -- Set true for transparent background
        terminal_colors = true,
      },
    })
    vim.cmd("colorscheme onedark")
  end,
}
