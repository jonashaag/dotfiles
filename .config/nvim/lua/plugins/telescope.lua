return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>f", builtin.find_files, {})
			vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
			--vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			--vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<esc>"] = "close",
							["<C-u>"] = false,
							["<C-j>"] = "move_selection_next",
							["<C-k>"] = "move_selection_previous",
						},
					},
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			local frecency = require("telescope").load_extension("frecency")
			vim.keymap.set("n", "<leader>p",  function ()
				frecency.frecency({ workspace = 'CWD' })
			end)
		end,
		dependencies = { "kkharji/sqlite.lua" },
	},
}
