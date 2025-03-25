return {
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require('neoclip').setup()
      vim.keymap.set('n', '<C-a>', ':Telescope neoclip<CR>', { noremap = true, silent = true })
    end
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        manual_mode = false, -- Auto-detect projects without opening first
        detection_methods = { "lsp", "pattern" },
        patterns = { ".git", "Gemfile", "package.json", "yarn.lock" },
        silent_chdir = false,                                 -- Folder change ka prompt dega
        scope_chdir = "global",                               -- Global project tracking
        datapath = vim.fn.stdpath("data") .. "/project_nvim", -- Save project list
      })
      vim.keymap.set('n', '<leader>fp', ':Telescope projects<CR>', { noremap = true, silent = true })
    end
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
      require("flash").setup({
        labels = "asdfghjklqwertyuiopzxcvbnm", -- Easy keys for jumping
        modes = {
          search = { enabled = true },         -- `/` ke saath flash enable
          char = { enabled = true },           -- Sneak-like motion
          treesitter = { enabled = true },     -- Better syntax jumps
        }
      })

      -- Keymaps for Flash.nvim
      vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { noremap = true, silent = true })
      vim.keymap.set({ "n", "o", "x" }, "S", function() require("flash").treesitter() end,
        { noremap = true, silent = true })
      vim.keymap.set({ "o" }, "<C-e>", function() require("flash").remote() end, { noremap = true, silent = true })
    end
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      vim.o.foldcolumn = '1' -- Show fold column
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Hide fold level numbers in the fold column
      vim.o.fillchars = "eob: ,fold: ,foldopen:,foldclose:"


      -- Folding Keybindings
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = "Open all folds" })
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = "Close all folds" })

      vim.keymap.set('n', '<leader>z', 'za', { desc = "Toggle Fold" })

      -- Setup ufo with Treesitter & LSP
      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end
      })
    end
  },
}
