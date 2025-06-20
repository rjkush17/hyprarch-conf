return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
     git = {
    enable = true,      -- enable git integration
    ignore = false,     -- show ignored files, set to false to see untracked files
  },
})
      

      -- Keybindings
      vim.keymap.set("n", "<leader>b", "<cmd>NvimTreeFocus<CR>", { desc = "Focus nvim-tree" })
      vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle nvim-tree" })
    end,
  },
}

