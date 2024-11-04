return {
	"dstein64/nvim-scrollview",
	config = function()
		require("scrollview").setup({
			signs_on_startup = {
				"changelist",
				"conflicts",
				"diagnostics",
				"folds",
				"latestchange",
				"loclist",
				"marks",
				"quickfix",
				"search",
				"spell",
				"trail",
			},
		})
	end,
}
