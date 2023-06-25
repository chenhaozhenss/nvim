return {
	"nvim-orgmode/orgmode",
	config = function()
    require('orgmode').setup_ts_grammar()
		require("orgmode").setup({
			org_agenda_files = { "~/Dropbox/org/*", "~/my-orgs/**/*" },
			org_default_notes_file = "~/Dropbox/org/refile.org",
		})
		require("nvim-treesitter.configs").setup({
			-- If TS highlights are not enabled at all, or disabled via `disable` prop,
			-- highlighting will fallback to default Vim syntax highlighting
		ensure_installed = { "org" }, -- Or run :TSUpdate org
		})
	end,
}

