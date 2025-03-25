return {
    "Pocco81/auto-save.nvim",
    config = function()
        require("auto-save").setup({
            enabled = true,  -- Start auto-save when Neovim starts
            execution_message = {
                message = function() -- Custom message on save
                    return "File saved at " .. os.date("%H:%M:%S")
                end,
                dim = 0.18, -- Opacity of the message
                cleaning_interval = 2000, -- Message disappears after 2 seconds
            },
            debounce_delay = 5000, -- Custom auto-save interval (milliseconds)
        })
    end
}

