local utils = require("profiles.utils")

local M = {}

-- buggy, atm it's not possible to override the default values
-- since lazy.nvim checks enabled before calling setup
function M.setup(opts)
	require("profiles.config").setup(opts)
end

function M.get()
	local cfg = utils.read_profile_file()

	if cfg == nil then
		return false
	end

	return cfg.profile
end

function M.is(profile)
	local cfg = utils.read_profile_file()

	if cfg == nil then
		return false
	end

	return cfg.profile == profile
end

return M
