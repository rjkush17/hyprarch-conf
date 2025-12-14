return {
  "eero-lehtinen/oklch-color-picker.nvim",
  event = "VeryLazy",
  version = "*",
  keys = {
    {
      "<leader>v",
      function() require("oklch-color-picker").pick_under_cursor() end,
      desc = "Color pick under cursor",
    },
  },
  --@type oklch.Opts
  opts = {
    highlight = {
      enabled = true,
      style = "virtual_left",  -- <-- change this for VS Code-style box
      virtual_text = "󰀘 ",     -- character for the box
      bold = false,
      italic = false,
      priority = 175,
      enabled_lsps = { "tailwindcss", "cssls", "css_variables" },
    },
    patterns = {
      tailwind = {
        priority = -2,
        "%f[%w][%l%-]-%-()%l-%-%d%d%d?%f[%W]()",
      },
    },
  },
}
