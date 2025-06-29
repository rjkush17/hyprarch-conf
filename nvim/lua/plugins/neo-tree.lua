return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        window = {
          width = 33,
          components = {
            indent = {
              enable = false, 
            },
          },
        },
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
      })

      -- Keymaps
      vim.keymap.set('n', '<C-b>', ':Neotree filesystem toggle left<CR>', { desc = "Toggle Neo-tree" })
      vim.keymap.set("n", "<leader>b", function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd("wincmd p")
        else
          vim.cmd("Neotree focus")
        end
      end, { noremap = true, silent = true, desc = "Focus/switch Neo-tree" })
    end
  }
}
