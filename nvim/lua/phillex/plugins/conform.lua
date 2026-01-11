return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				typescript = function(bufnr)
					if conform.get_formatter_info("prettier", bufnr).available then
						return { "prettier", lsp_fallback = "never" }
					else
						return { "biome", "prettier", "biome-organize-imports", "biome-check", lsp_format = "never" }
					end
				end,
				javascript = function(bufnr)
					if conform.get_formatter_info("prettier", bufnr).available then
						return { "prettier", lsp_fallback = "never" }
					else
						return { "biome", "prettier", "biome-organize-imports", "biome-check", lsp_format = "never" }
					end
				end,
				typescriptreact = function(bufnr)
					if conform.get_formatter_info("prettier", bufnr).available then
						return { "prettier", lsp_fallback = "never" }
					else
						return { "biome", "prettier", "biome-organize-imports", "biome-check", lsp_format = "never" }
					end
				end,
				javascriptreact = function(bufnr)
					if conform.get_formatter_info("prettier", bufnr).available then
						return { "prettier", lsp_fallback = "never" }
					else
						return { "biome", "prettier", "biome-organize-imports", "biome-check", lsp_format = "never" }
					end
				end,
				svelte = { "biome", "prettier", "biome-organize-imports", "biome-check" },
				css = { "biome", "prettier", "biome-check" },
				html = { "biome", "prettier", "biome-check" },
				json = function(bufnr)
					if conform.get_formatter_info("prettier", bufnr).available then
						return { "prettier", lsp_fallback = "never" }
					else
						return { "biome", "prettier", "biome-check", lsp_format = "never" }
					end
				end,
				yaml = function(bufnr)
					if conform.get_formatter_info("prettier", bufnr).available then
						return { "prettier", lsp_fallback = "never" }
					else
						return { "biome", "prettier", "biome-check", lsp_format = "never" }
					end
				end,
				markdown = { "prettier" },
				graphql = { "biome", "biome-check" },
				lua = { "stylua" },
				go = { "gofumpt" },
				python = function(bufnr)
					if conform.get_formatter_info("ruff_format", bufnr).available then
						return { "ruff_format", "ruff_fix", "ruff_organize_imports" }
					else
						return { "isort", "black" }
					end
				end,
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
