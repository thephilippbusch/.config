---Detect the root directory based on git or current file
---@param bufnr string
---@return string
local function get_workspace_root(bufnr)
	local fname = vim.api.nvim_buf_get_name(bufnr)
	if fname == "" then
		return vim.loop.cwd()
	end

	-- Try to find nearest .git, else fallback to cwd
	local git_dir = vim.fs.find(".git", { upward = true, path = vim.fs.dirname(fname) })[1]
	if git_dir then
		return vim.fs.dirname(git_dir)
	else
		return vim.loop.cwd()
	end
end

return get_workspace_root
