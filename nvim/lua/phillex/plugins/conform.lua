return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		-- biome-check only runs when a biome config is found upward from the buffer
		-- (see require_cwd below), so prettier takes over in every other project
		local web = { "biome-check", "prettier", stop_after_first = true }

		conform.setup({
			formatters = {
				["biome-check"] = {
					require_cwd = true,
				},
			},
			formatters_by_ft = {
				javascript = web,
				javascriptreact = web,
				typescript = web,
				typescriptreact = web,
				json = web,
				jsonc = web,
				css = web,
				html = web,
				graphql = web,
				svelte = web,
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				go = { "gofumpt" },
				python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
				rust = { "rustfmt" },
				proto = { "buf" },
			},
			format_on_save = {
				lsp_format = "fallback",
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_format = "fallback",
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
