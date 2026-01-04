-- 🌙 Neovim Built-in LSP Configuration
---------------------------------------------------------------
-- 🔹 Common LSP Keymaps
---------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }
		-- 🧭 Navigation
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Go to definition
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Hover docs
		-- ✍️ Editing
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Rename symbol
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Code actions (quick fix)
		vim.lsp.inlay_hint.enable(false) -- this enable the inline hind for the lsp
	end,
})
--
-- ---------------------------------------------------------------
-- -- 🌙 Lua (Neovim Config / Plugin Development)
-- ---------------------------------------------------------------
vim.lsp.config["lua_ls"] = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}
--
-- ---------------------------------------------------------------
-- -- ⚡ JavaScript / TypeScript / React (Frontend + Node)
-- ---------------------------------------------------------------
vim.lsp.config["vtsls"] = {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"jsx",
		"tsx",
		"js",
		"ts",
	},
	root_markers = { "package.json", "tsconfig.json", ".git" },
	settings = {
		javascript = { suggest = { autoImports = true } },
		typescript = { suggest = { autoImports = true } },
	},
}

-- ---------------------------------------------------------------
-- -- ⚡ Rust
-- ---------------------------------------------------------------
vim.lsp.config["rust-analyzer"] = {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", "rust-project.json", ".git" },

  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
        buildScripts = { enable = true },
      },

      diagnostics = {
        enable = true,
        experimental = { enable = false },
      },

      checkOnSave = {
        enable = true,
        command = "clippy",
      },

      completion = {
        autoimport = { enable = true },
      },

      procMacro = {
        enable = true,
      },

      inlayHints = {
        bindingModeHints = { enable = true },
        chainingHints = { enable = true },
        closingBraceHints = { enable = true },
        closureReturnTypeHints = { enable = "always" },
        lifetimeElisionHints = { enable = "always" },
        typeHints = { enable = true },
      },
    },
  },
}


---------------------------------------------------------------
-- 🎨 HTML / CSS / JSON (Frontend basics)
---------------------------------------------------------------
-- vim.lsp.config["html"] = {
--   cmd = { "vscode-html-language-server", "--stdio" },
--   filetypes = { "html" },
-- }
--
-- vim.lsp.config["cssls"] = {
--   cmd = { "vscode-css-language-server", "--stdio" },
--   filetypes = { "css", "scss" },
-- }
--
-- vim.lsp.config["jsonls"] = {
--   cmd = { "vscode-json-language-server", "--stdio" },
--   filetypes = { "json" },
-- }

---------------------------------------------------------------
-- 🌈 TailwindCSS (Utility-first styling)
---------------------------------------------------------------
-- vim.lsp.config["tailwindcss"] = {
--     cmd = { "tailwindcss-language-server", "--stdio" },
--     filetypes = {
--         "html", "css", "scss",
--         "javascript", "javascriptreact",
--         "typescript", "typescriptreact",
--         "jsx", "tsx",
--     },
--     root_markers = { "tailwind.config.js", "postcss.config.js", ".git" },
--     settings = {
--         tailwindCSS = {
--             experimental = {
--                 classRegex = { "tw`([^`]*)", "tw\\(([^)]*)", "cn\\(([^)]*)" },
--             },
--         },
--     },
-- }

---------------------------------------------------------------
-- 🧰 Node.js Backend / ESLint (Code Quality)
---------------------------------------------------------------
-- vim.lsp.config["eslint"] = {
--     cmd = { "vscode-eslint-language-server", "--stdio" },
--     filetypes = {
--         "javascript", "javascriptreact",
--         "typescript", "typescriptreact",
--         "vue", "svelte",
--     },
--     root_markers = {
--         ".eslintrc.js", ".eslintrc.json", "package.json", ".git",
--     },
-- }
--
---------------------------------------------------------------
-- 🚀 Enable All Configured LSPs
---------------------------------------------------------------
vim.lsp.enable({
	"lua_ls", -- Lua
	"ts_ls", -- JS / TS / React
	"html", -- HTML
	"cssls", -- CSS / SCSS
	"jsonls", -- JSON
	"tailwindcss", -- Tailwind CSS
	"eslint", -- ESLint
	"rust-analyzer", -- Rust
})

---------------------------------------------------------------
-- 💾 Optional: Auto Format on Save
---------------------------------------------------------------
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     callback = function()
--         vim.lsp.buf.format({ async = false })
--     end,
-- })
-- Manual format keybind
-- vim.keymap.set("n", "<leader>gf", function()
--     vim.lsp.buf.format({ async = true })
-- end, { desc = "Format file" })

---------------------------------------------------------------
-- ✅ End of Native LSP Setup
---------------------------------------------------------------
