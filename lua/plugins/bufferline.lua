return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				-- 关闭 Tab 的命令，这里使用 moll/vim-bbye 的 :Bdelete 命令
				-- 侧边栏配置
				-- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
				offsets = {
					{
						filetype = "neo-tree",
						text = "neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
          modified_icon = '',
				-- 使用 nvim 内置 LSP  后续课程会配置
				diagnostics = "nvim_lsp",
        always_show_bufferline=false,
				-- 可选，显示 LSP 报错图标
				---@diagnostic disable-next-line: unused-local
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " " or (e == "warning" and " " or "")
						s = s .. n .. sym
					end
					return s
				end,
			},
		})
	end,
}
