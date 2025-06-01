return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        hl_group = "MyChunkHighlight",
      },
      indent = {
        enable = true,
      },
    })

    -- Define the custom highlight group using Onedarkpro colors
    vim.api.nvim_set_hl(0, "MyChunkHighlight", { fg = "#61AFEF", bg = "#1E1E2E", bold = true })
  end,
}

