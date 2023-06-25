return {
	"xiyaowong/transparent.nvim",
	config = function()
		require("transparent").setup({
			groups = { -- table: default groups
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLineNr",
				"EndOfBuffer",
				"Neotree",
			},
			extra_groups = {
				"BufferLineTabClose",
				"BufferlineBufferSelected",
				"BufferLineFill",
				"BufferLineBackground",
				"BufferLineSeparator",
				"BufferLineIndicatorSelected",
        'BufferLineIcon',

				"neotreeNormal",
				"neotreeNormalNC",
				"NormalFloat",
				"lualineNormal",
				"lualineNormalNC",
        'LuaLineBackground',
				"telescopeNormal",
				"telescopeNormalNC",
				"nvim-cmpNormal",
				"nvim-cmpNormalNC",
			}, -- table: additional groups that should be cleared
			exclude_groups = {}, -- table: groups you don't want to clear
		})
		vim.g.transparent_groups = vim.list_extend(
			vim.g.transparent_groups or {},
			vim.tbl_map(function(v)
				return v.hl_group
			end, vim.tbl_values(require("bufferline.config").highlights))
		)
	end,
}
