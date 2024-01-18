local profiles = require("profiles")

vim.api.nvim_create_user_command("GetProfile", function()
	vim.api.nvim_echo({ { profiles.get(), "Normal" } }, false, {})
end, {
	desc = "Get current profile.",
	range = false,
})
