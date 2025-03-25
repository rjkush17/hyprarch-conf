
return {
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          numbers = "none",                     -- No buffer numbers
          show_buffer_icons = true,             -- Display icons
          show_buffer_close_icons = true,       -- Show close button on buffers
          separator_style = "thick",             -- Thin separators
          always_show_bufferline = true,        -- Always show bufferline
          modified_icon = "●",                  -- Modified buffer icon
          close_icon = "",                     -- Close icon
          indicator = { style = "italic" },       -- Underline for active buffer

          -- Adjust bufferline when Neotree is open
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              text_align = "center",
              separator = true,
            }
          },
          
          custom_filter = function(buf_number)
            return true -- Display all buffers
          end,
        },
      })

      -- Keybindings for buffer navigation
      vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { noremap = true, silent = true }) -- Close current tab
    end,
  },
}

