local defaults = require("profiles.config")

local M = {}

function M.read_profile_file(options)
	local profile_file = options.profile_file or defaults.profile_file
	local global_path = options.global_path or defaults.global_path

	local cwd = vim.fn.getcwd()
	local cwd_profile_file = cwd .. "/" .. profile_file
	local global_profile = vim.fn.expand(global_path .. "/" .. profile_file)

	-- check if cwd has a profile file
	if vim.fn.filereadable(cwd_profile_file) == 1 then
		return vim.fn.json_decode(vim.fn.readfile(cwd_profile_file))
	end

	-- check if global profile file exists
	if vim.fn.filereadable(global_profile) == 1 then
		return vim.fn.json_decode(vim.fn.readfile(global_profile))
	else
		local profile_content = { profile = "default" }
		vim.fn.writefile(profile_content, global_profile)
		return profile_content
	end
end

return M
