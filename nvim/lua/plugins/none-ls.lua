return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua, -- Lua
                null_ls.builtins.formatting.prettier, -- JS, TS, JSX, TSX, JSON, CSS, HTML
                null_ls.builtins.formatting.htmlbeautifier, -- HTML
                null_ls.builtins.diagnostics.rubocop, -- Ruby lint
                null_ls.builtins.diagnostics.eslint, -- JS/TS lint
                null_ls.builtins.diagnostics.erblint, -- ERB
                null_ls.builtins.formatting.rubocop, -- Ruby
                null_ls.builtins.formatting.fixjson, -- JSON
            },

            -- 👇 Auto-format only for specific filetypes
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            -- List of filetypes you want auto-formatting enabled for
                            local ft = vim.bo[bufnr].filetype
                            local allowed = {
                                "javascript",
                                "typescript",
                                "javascriptreact",
                                "typescriptreact",
                                "json",
                                "html",
                                "css",
                            }

                            if vim.tbl_contains(allowed, ft) then
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end
                        end,
                    })
                end
            end,
        })
    end,
}
