return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup()
            require("notify").setup({
                stages = "slide",
                timeout = 2000,
                render = "compact",
                background_colour = "#000000",
                max_width = 45,
                max_height = 4,
                top_down = true, -- show in bottom-right
            })
            vim.notify = require("notify")
        end,
    },
    {
        "j-hui/fidget.nvim",
        event = "LspAttach", -- Load only when LSP starts
        opts = {
            progress = {
                suppress_on_insert = true, -- Don't show while typing
                display = {
                    done_icon = "✔", -- Simple done icon
                    progress_icon = { "dots" }, -- Animated dots while loading
                },
            },
            notification = {
                window = {
                    winblend = 0, -- Slight transparency
                    border = "none", -- Rounded border for better visuals
                    blend = 0,
                },
            },
        },
    },
}
