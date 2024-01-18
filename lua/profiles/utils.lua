local M = {}

function M.read_profile_file(options)
	local cwd = vim.fn.getcwd()
	local cwd_profile_file = cwd .. "/" .. options.profile_file
	local global_profile = vim.fn.expand(options.global_path .. "/" .. options.profile_file)

	-- check if cwd has a profile file
	if vim.fn.filereadable(cwd_profile_file) == 1 then
		return vim.fn.json_decode(vim.fn.readfile(cwd_profile_file))
	end

	-- check if global profile file exists
	if vim.fn.filereadable(global_profile) == 1 then
		return vim.fn.json_decode(vim.fn.readfile(global_profile))
	else
		local profile_content = { profile = "default" }
		vim.fn.writefile(vim.fn.json_encode(profile_content), global_profile)
		return profile_content
	end
end

return M
