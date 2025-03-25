return {
  "mg979/vim-visual-multi",
  branch = "master",
  init = function()
    vim.g.VM_default_mappings = 0 -- Disable default mappings if you want custom ones

       -- Custom Keymaps
    vim.g.VM_maps = {
      ["Find Under"] = "<C-d>",       -- Like VS Code multi-cursor
      ["Find Subword Under"] = "<C-d>",
      ["Remove Region"] = "<C-x>",     -- Remove one cursor
      ["Skip Region"] = "<C-n>",       -- Skip current match and move to next
      ["Undo"] = "<C-z>",              -- Undo last selection
      ["Redo"] = "<C-r>",              -- Redo last selection
      ["Start Regex Search"] = "g/",    -- Start regex search
    }
  end
}
