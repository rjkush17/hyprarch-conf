return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    event = "VeryLazy",
    build = ":TSUpdate",
    config = function()
        -- New API: install parsers directly
        require("nvim-treesitter").install({ "lua", "rust", "javascript", "typescript", "bash", "json", "markdown", "html", "css" })

        -- Highlighting & indent are now handled by Neovim core
        -- Enable them via FileType autocmd
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                pcall(vim.treesitter.start) -- highlighting
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- indent
            end,
        })
    end,
}
