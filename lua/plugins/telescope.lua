return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.1",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		telescope = require("telescope")
		telescope.setup({
			defaults = {
				-- Default configuration for telescope goes here:
				-- config_key = value,
				mappings = {
					i = {
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
						["<Down>"] = "move_selection_next",
						["<Up>"] = "move_selection_previous",
						-- 历史记录
						["<C-n>"] = "cycle_history_next",
						["<C-p>"] = "cycle_history_prev",
						-- 预览窗口上下滚动
						["<C-u>"] = "preview_scrolling_up",
						["<C-d>"] = "preview_scrolling_down",
					},
					n = {},
				},
				pickers = {
					-- Default configuration for builtin pickers goes here:
					-- picker_name = {
					--   picker_config_key = value,
					--   ...
					-- }
					-- Now the picker_config_key will be applied every time you call this
					-- builtin picker
				},
				extensions = {
					media_files = {
						-- filetypes whitelist
						-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
						filetypes = { "png", "webp", "jpg", "jpeg" },
						-- find command (defaults to `fd`)
						find_cmd = "rg",
					},
					-- Your extension configuration goes here:
					-- extension_name = {
					--   extension_config_key = value,
					-- }
					-- please take a look at the readme of the extension you want to configure
				},
			},
		})
		require("telescope").load_extension("neoclip")
		require("telescope").load_extension("media_files")
		require("telescope").load_extension("lazygit")
	end,
}
