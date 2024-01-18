local profiles = require("profiles")
local Config = require("profiles.config")

vim.api.nvim_create_user_command("GetProfile", function()
	vim.api.nvim_echo({ { profiles.get(), "Normal" } }, false, {})
end, {
	desc = "Get current profile.",
	range = false,
})

vim.api.nvim_create_user_command("ProfilesDebug", function()
	local data = Config.options

	vim.api.nvim_echo({ { data.filename .. " - " .. data.global_path, "Normal" } }, false, {})
end, {
	desc = "Get current profile.",
	range = false,
})
