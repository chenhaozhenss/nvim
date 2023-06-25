return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	config = function()
		require("null-ls").setup({
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.eslint,
					null_ls.builtins.completion.spell,
				},
			}),
		}) -- require your null-ls config here (example below)
		require("mason-null-ls").setup({
			ensure_installed = {
				"stylua",
				"jq",
			},
		})
	eslint.setup({
		bin = "eslint", -- or `eslint_d`
		code_actions = {
			enable = true,
			apply_on_save = {
				enable = true,
				types = { "directive", "problem", "suggestion", "layout" },
			},
			disable_rule_comment = {
				enable = true,
				location = "separate_line", -- or `same_line`
			},
		},
		diagnostics = {
			enable = true,
			report_unused_disable_directives = false,
			run_on = "type", -- or `save`
		},
	})
end
}
