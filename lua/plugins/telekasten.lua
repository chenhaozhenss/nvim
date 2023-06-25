return {
	"renerocksai/telekasten.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		require("telekasten").setup({
      auto_set_filetype = false,
			home = vim.fn.expand("~/Documents/note"), -- Put the name of your notes directory here
		})
	end,
}
