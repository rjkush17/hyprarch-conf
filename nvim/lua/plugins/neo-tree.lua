return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      view = { width = 33, side = "left", signcolumn = "no" },
      git = { enable = true, ignore = false },
      diagnostics = { enable = true, icons = { hint="", info="", warning="", error="" } },
      renderer = {
        indent_markers = { enable = false },
        icons = {
          show = { diagnostics=true, git=true, folder=true, file=true, folder_arrow=true },
          diagnostics_placement = "right_align",
        },
        highlight_diagnostics = "icon",
        group_empty = true,
        root_folder_label = function(path)
          return vim.fn.fnamemodify(path, ":t")
        end,
      },
      update_focused_file = { enable=true, update_root=false },
      filters = { dotfiles=false, custom={"^.git$"} },
    })

   
  end,
}

