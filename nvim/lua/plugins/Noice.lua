return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify"
  },
  config = function()
    require("noice").setup({

    })
    require("notify").setup({
      stages = "fade_in_slide_out",
      timeout = 2000,
      render = "compact",
      background_colour = "#000000",
      width = 45,   -- Set the maximum width for notifications
      height = 4,   -- Set the maximum height for notification s
    })
    vim.api.nvim_set_keymap("n", "<leader>n", ":Noice<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>c", ":NoiceDismiss<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>nh", ":NoiceHistory<CR>", { noremap = true, silent = true })
  end
} 
