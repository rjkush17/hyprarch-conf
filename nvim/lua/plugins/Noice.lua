return {
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
            top_down = false, -- show in bottom-right
        })
        vim.notify = require("notify")
    end,
}
