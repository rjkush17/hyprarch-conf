return {
    "Toprun123/PicVim",
    config = function()
        require'picvim'.setup({
    filetypes = {                         -- Default filetypes
        "png",                            -- For now only these are supported:
        "jpg",                            -- >   PNG, JPG, JPEG, GIF, BMP
        "jpeg",
        "gif",                            -- No need to set these if you want to
        "bmp",                            -- support all of these image formats.
    },
    keymap = {                            -- Default keymaps
        move_left = { "<Left>", "h" },    -- Pan left
        move_right = { "<Right>", "l" },  -- Pan right
        move_down = { "<Down>", "j" },    -- Pan down
        move_up = { "<Up>", "k" },        -- Pan up
        zoom_in = { "=", "+" },           -- Zoom in
        zoom_out = { "-", "_" },          -- Zoom out
        rotate_clockwise = "t",           -- Rotate clockwise by 30 degrees
        rotate_counterclockwise = "T",    -- Rotate counterclockwise by 30 degrees
        reset = "o",                      -- Reset image
        rerender = "r",                   -- Rerender image
    }
})
    end,
}
