local Config = require("profiles.config")

local M = {}

function M.read_profile_file()
	local filename = Config.options.filename or Config.defaults.filename
	local fallback_dir = Config.options.global_path or Config.defaults.global_path

	-- check if cwd has a profile file
	local cwd_file = vim.fn.getcwd() .. "/" .. filename
	if vim.fn.filereadable(cwd_file) == 1 then
		return vim.fn.json_decode(vim.fn.readfile(cwd_file))
	end

	-- check if global profile file exists
	local fallback_file = vim.fn.expand(fallback_dir .. "/" .. filename)
	if vim.fn.filereadable(fallback_file) == 1 then
		return vim.fn.json_decode(vim.fn.readfile(fallback_file))
	else
		return {
			profile = "<not-found>",
		}
	end
end

return M
