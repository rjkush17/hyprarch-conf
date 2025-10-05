-- ~/.config/nvim/lua/plugins/harpoon.lua
return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup()

        -- harpoon Plugins
vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)
-- Show quick menu
vim.keymap.set("n", "<leader>e", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
-- Jump to files 1–4
vim.keymap.set("n", "<leader>1", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>2", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>3", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>4", function()
	harpoon:list():select(4)
end)
vim.keymap.set("n", "<leader>5", function()
	harpoon:list():select(5)
end)
vim.keymap.set("n", "<leader>6", function()
	harpoon:list():select(6)
end)
vim.keymap.set("n", "<leader>7", function()
	harpoon:list():select(7)
end)
vim.keymap.set("n", "<leader>8", function()
	harpoon:list():select(8)
end)
vim.keymap.set("n", "<leader>9", function()
	harpoon:list():select(9)
end)
vim.keymap.set("n", "<leader>0", function()
	harpoon:list():select(10)
end)

-- Cycle marks
vim.keymap.set("n", "<leader>p", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<leader>n", function()
	harpoon:list():next()
end)
    end,
}
