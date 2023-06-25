return {
	"glepnir/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			-- config
			theme = "hyper",
			config = {
				week_header = {
					enable = true,
				},
				shortcut = {
					{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
				},
			}, --  config used for theme
			hide = {
				statusline, -- hide statusline default is true
				tabline, -- hide the tabline
				winbar, -- hide winbar
			},
			preview = {
				command, -- preview command
				file_path, -- preview file path
				file_height, -- preview file height
				file_width, -- preview file width
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
