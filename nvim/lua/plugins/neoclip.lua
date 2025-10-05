return {
    {
        "AckslD/nvim-neoclip.lua",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("neoclip").setup()
        end,
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        config = function()
            require("flash").setup({
                labels = "asdfghjklqwertyuiopzxcvbnm", -- Easy keys for jumping
                modes = {
                    search = { enabled = true }, -- `/` ke saath flash enable
                    char = { enabled = true }, -- Sneak-like motion
                    treesitter = { enabled = true }, -- Better syntax jumps
                },
            })
        end,
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
        config = function()
            vim.o.foldcolumn = "1" -- Show fold column
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            -- Hide fold level numbers in the fold column
            vim.o.fillchars = "eob: ,fold: ,foldopen:,foldclose:"
            -- Setup ufo with Treesitter & LSP
            require("ufo").setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return { "treesitter", "indent" }
                end,
            })
        end,
    },
}
