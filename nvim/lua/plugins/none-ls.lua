return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- ✅ Formatters
                null_ls.builtins.formatting.stylua,          -- Lua
                null_ls.builtins.formatting.prettier,        -- JS, TS, JSX, TSX, JSON, CSS, HTML
                null_ls.builtins.formatting.htmlbeautifier,  -- HTML
                null_ls.builtins.formatting.rubocop,         -- Ruby
                null_ls.builtins.formatting.fixjson,         -- JSON

                -- ✅ Linters
                null_ls.builtins.diagnostics.rubocop,  -- Ruby lint
                null_ls.builtins.diagnostics.eslint,   -- JS/TS lint
                null_ls.builtins.diagnostics.erblint,  -- ERB
            },

            -- 👇 Auto-format on save (only for selected filetypes)
        })
    end,
}

