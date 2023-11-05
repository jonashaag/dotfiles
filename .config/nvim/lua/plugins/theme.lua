return {
	-- {
	-- 	"navarasu/onedark.nvim",
	-- },
	-- { "rakr/vim-one" },
	-- {
	-- 	"sonph/onehalf",
	--
	-- 	config = function(plugin)
	-- 		vim.opt.rtp:append(plugin.dir .. "/vim")
	-- 	end,
	-- },
	{
		"projekt0n/github-nvim-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("github-theme").setup({
				groups = {
					all = {
						CocInlayHint = { fg = 'syntax.comment', bg = 'NONE' },
					}
				}
			})

			vim.cmd("colorscheme github_light_high_contrast")
		end,
	},
}
