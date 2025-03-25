return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "solargraph", "ruby_lsp" } -- Add other LSPs as needed
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig") -- Correct variable name

			-- Lua LSP setup
			lspconfig.lua_ls.setup({})

			-- TypeScript/JavaScript LSP setup
			lspconfig.ts_ls.setup({})

			-- Ruby LSP setup
			lspconfig.solargraph.setup({})

			-- Ruby LSP setup
			lspconfig.ruby_lsp.setup({})

			-- Key mappings for LSP functionality
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "LSP Hover" }) -- Fix typo: 'k' -> 'K'
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
			vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action" })
		end
	}
}

