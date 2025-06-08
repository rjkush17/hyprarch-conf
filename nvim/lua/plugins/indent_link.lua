return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl", -- tells lazy.nvim to use 'ibl' module
  opts = {
    indent = { char = "│" },
    scope = {
      enabled = true,
      show_start = true,
      show_end = false,
      highlight = { "IndentBlanklineContextChar" },
    },
    exclude = {
      filetypes = { "help", "lazy", "alpha", "dashboard", "neo-tree", "Trouble", "mason" },
      buftypes = { "terminal", "nofile" },
    },
  },
}

