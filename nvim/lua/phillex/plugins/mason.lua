return {
	"mason-org/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			enable = true,
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			automatic_enable = true,
			ensure_installed = {
				"biome",
				"cssls",
				"graphql",
				"html",
				"jsonls",
				"lua_ls",
				"prismals",
				"pyright",
				"rust_analyzer",
				"svelte",
				"tailwindcss",
				"ts_ls",
				"yamlls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"biome", -- biome formatter
				"prettier", -- prettier formatter
				"gofumpt", -- go formatter
				"mdformat", -- markdown formatter
				"ruff", -- python formatter
				"stylua", -- lua formatter
				"eslint", -- ts/js linter
				"black", -- fallback python formatter
				"isort", -- fallback python import sorter
			},
		})
	end,
}
