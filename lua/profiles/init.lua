local utils = require("profiles.utils")
local default_config = require("profiles.config")

local M = {
	options = default_config,
}

function M.config(opts)
	M.options = opts
	return M.config
end

function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", M.options, opts or {})
	return M.options
end

function M.get()
	local cfg = utils.read_profile_file(M.options)

	if cfg == nil then
		return false
	end

	return cfg.profile
end

function M.is(profile)
	local cfg = utils.read_profile_file(M.options)

	if cfg == nil then
		return false
	end

	return cfg.profile == profile
end

return M
