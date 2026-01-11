return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "biome", "biome-organize-imports", "biome-check", lsp_format = "never" },
				typescript = { "biome", "biome-organize-imports", "biome-check", lsp_format = "never" },
				javascriptreact = { "biome", "biome-organize-imports", "biome-check", lsp_format = "never" },
				typescriptreact = { "biome", "biome-organize-imports", "biome-check", lsp_format = "never" },
				svelte = { "biome", "biome-organize-imports", "biome-check" },
				css = { "biome", "biome-check" },
				html = { "biome", "biome-check" },
				json = { "biome", "biome-check", lsp_format = "never" },
				markdown = { "mdformat" },
				graphql = { "biome", "biome-check" },
				lua = { "stylua" },
				go = { "gofumpt" },
				python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
				rust = { "rustfmt" },
				proto = { "buf" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
