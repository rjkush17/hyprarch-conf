return {
    "Pocco81/auto-save.nvim",
    config = function()
        require("auto-save").setup({
            execution_message = {
                enabled = false,
                message = function() -- Custom message on save
                    return "󰄳 File saved successfully!"
                end,
                dim = 0.18,   -- Opacity of the message
                cleaning_interval = 2000, -- Message disappears after 2 second
            },
            debounce_delay = 5000, -- Custom auto-save interval (milliseconds)
        })
    end,
}
