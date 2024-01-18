local M = {}

M.defaults = {
	global_path = "~",
	filename = ".nvim-profile.json",
}

M.options = {}

function M.setup(options)
	M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

return M
