return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Icons ke liye
    config = function()
        require('lualine').setup({
            options = {
                theme = 'auto',
                globalstatus = true, -- Ek hi statusline across tabs
                icons_enabled = true,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = {
                    { 'mode', upper = true }, -- Mode uppercase me dikhega
                },
                lualine_b = { 'branch', 'diff' },
                lualine_c = {
                    {
                        'filename',
                        file_status = true, -- + if modified
                        path = 1, -- 0 = filename, 1 = relative path, 2 = absolute path
                    },
                    { 'diagnostics', sources = { 'nvim_lsp' } },
                },
                lualine_x = {
                    {
                        function()
                            local msg = 'No LSP'
                            local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                            local clients = vim.lsp.get_active_clients()
                            if next(clients) == nil then return msg end
                            for _, client in ipairs(clients) do
                                local filetypes = client.config.filetypes
                                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                    return '  LSP: ' .. client.name
                                end
                            end
                            return msg
                        end,
                        icon = ' ',
                    },
                    'encoding',
                    'fileformat',
                    'filetype',
                },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },
            },
        })
    end
}

