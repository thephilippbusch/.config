return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		local function get_js_linter()
			local bufnr = vim.api.nvim_get_current_buf()

			local root = vim.fs.root(bufnr, { ".git", "package.json" }) or vim.fn.getcwd()
			local linter = "biomejs" -- default

			if vim.fn.filereadable(root .. "/biome.json") == 1 then
				linter = "biomejs"
			elseif vim.fn.glob(root .. "/.eslintrc*") ~= "" or vim.fn.glob(root .. "/eslint.config.*") == 1 then
				linter = "eslint"
			end

			return { linter }
		end

		lint.linters_by_ft = {
			javascript = get_js_linter(),
			typescript = get_js_linter(),
			javascriptreact = get_js_linter(),
			typescriptreact = get_js_linter(),
			json = { "biomejs" },
			python = { "ruff" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
