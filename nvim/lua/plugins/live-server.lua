return {
  "barrett-ruth/live-server.nvim",
  build = "npm install -g live-server",  -- Installs live-server globally
  config = function()
    require("live-server").setup()

    -- Keybindings to control the live server
    vim.api.nvim_set_keymap("n", "<leader>ls", ":LiveServerStart<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>le", ":LiveServerStop<CR>", { noremap = true, silent = true })
  end,
  ft = { "html", "css", "js" }  -- Load only for these filetypes
}

