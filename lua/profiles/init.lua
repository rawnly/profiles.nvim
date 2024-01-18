local utils = require("profiles.utils")

local M = {}

M.config = {
	global_path = "~/.config/astronvim/lua/user",
	profile_file = ".nvim-profile.json",
}

function M.setup(config)
	M.config = vim.tbl_deep_extend("force", M.config, config or {})
	return M.config
end

function M.is(profile)
	local cfg = utils.read_profile_file()

	if cfg == nil then
		return false
	end

	return vim.fn.match(cfg.profile, profile)
end

return M
