local mod = {}

-- Cache of detected linters per root path
---@type string[]
mod.cached_linters = {}

-- Detect the correct linter based on files in the root
---@param root string
---@param config string
---@param config_file_names string | string[]
function mod.check_config(root, config, config_file_names)
	local is_config_found = vim.fs.find(config_file_names, { path = root, upward = false })[1]
	if is_config_found then
		mod.cached_linters[root] = config
		return true
	end

	return false
end

return mod
