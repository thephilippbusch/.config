local get_workspace_root = require("phillex.util.get-workspace-root")
local find_config = require("phillex.util.find-config")

---Checks for typescript/javascript linting config files and returns the corresponding linter. Default: "biomejs"
---@param bufnr string
---@return string
local function get_js_linter(bufnr)
	print(bufnr)
	local root = get_workspace_root(bufnr)

	if find_config.cached_linters[root] then
		return find_config.cached_linters[root]
	end

	-- Search for config files (upward from root)
	local has_biome_config = find_config.check_config(root, "biomejs", "biome.json")
	if has_biome_config then
		return "biomejs"
	end

	local has_eslint_config = find_config.check_config(root, "eslint", {
		"eslint.config.js",
		"eslint.config.mjs",
		"eslint.config.cjs",
		".eslintrc",
		".eslintrc.js",
		".eslintrc.json",
		".eslintrc.cjs",
	})
	if has_eslint_config then
		return "eslint"
	end

	return "biomejs"
end

---Executes the linter with the linter list adjusted by whichever config file is found in the workspace
---@param bufnr string
local function smart_lint(bufnr)
	local lint = require("lint")

	local ft = vim.bo[bufnr].filetype
	if vim.tbl_contains({ "javascript", "typescript", "javascriptreact", "typescriptreact", "json" }, ft) then
		local linter = get_js_linter(bufnr)
		lint.linters_by_ft[ft] = { linter }
	end
	lint.try_lint()
end

return smart_lint
