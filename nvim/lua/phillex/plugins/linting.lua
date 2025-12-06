local smart_lint = require("phillex.util.smart-linter")

return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "biomejs" },
			typescript = { "biomejs" },
			javascriptreact = { "biomejs" },
			typescriptreact = { "biomejs" },
			json = { "biomejs" },
			python = { "ruff" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function(args)
				smart_lint(args.buf)
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			smart_lint(vim.api.nvim_get_current_buf())
		end, { desc = "Trigger linting for current file" })
	end,
}
