return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup()
    vim.keymap.set("n", "<C-/>", "gc", { noremap = false, silent = true })
    vim.keymap.set("v", "<C-/>", "gc", { noremap = false, silent = true })
  end
}
