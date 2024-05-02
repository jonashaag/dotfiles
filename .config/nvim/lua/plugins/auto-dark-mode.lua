return {
	"f-person/auto-dark-mode.nvim",
	config = {
		update_interval = 60000,
		set_dark_mode = function()
			vim.api.nvim_set_option("background", "dark")
			vim.cmd("colorscheme github_dark_high_contrast")
		end,
		set_light_mode = function()
			vim.api.nvim_set_option("background", "light")
			vim.cmd("colorscheme github_light_high_contrast")
		end,
	},
}
