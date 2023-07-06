return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		--		"quangnguyen30192/cmp-nvim-ultisnips",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end
			local feedkey = function(key, mode)
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
			end
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					--					vim.fn["vsnip#anonymous"](args.body)
					require("luasnip").lsp_expand(args.body)
					--          vim.fn['ultisnips#Anon'](args.body)
				end,
			},
			window = {},
			mapping = cmp.mapping.preset.insert({
				["up"] = cmp.mapping.select_prev_item({ "i", "c" }),
				["down"] = cmp.mapping.select_next_item({ "i", "c" }),
				["<c-k>"] = cmp.mapping.select_prev_item({ "i", "c" }),
				["<c-j>"] = cmp.mapping.select_next_item({ "i", "c" }),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-i>"] = cmp.mapping.scroll_docs(4),
				["<C-space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }, "i", "c"), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = cmp.config.sources({
				{
					name = "nvim_lsp",
					entry_filter = function(entry, ctx)
						return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
					end,
				},
				{ name = "nivm_lsp_signature_help" },
				{ name = "cmp_lua" },
				{ name = "path" },
				--			{ name = "orgmode" },
				{ name = "luasnip" },
				{ name = "buffer" },
			}),
		})
		-- Set configuration for specific filetype.
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
			}, {
				{ name = "buffer" },
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline({
				["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item()),
				["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item()),
				["<CR>"] = cmp.mapping(cmp.mapping.confirm({ select = true })),
			}),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ ":" }, {
			autocomplete = false,
			sources = cmp.config.sources({
				{ name = "path" },
				{ name = "buffer" },
				{
					name = "cmdline",
					option = {
						ignore_cmds = { "Man", "!" },
					},
				},
			}),
			mapping = cmp.mapping.preset.cmdline({
				["<c-j>"] = {
					c = function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-z>", true, true, true), "ni", true)
						end
					end,
				},
        ["<c-k>"] = {
					c = function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-z>", true, true, true), "ni", true)
						end
					end,
				},
			}),
		})
		-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- The following example advertise capabilities to `clangd`.
		require("lspconfig").clangd.setup({

			capabilities = capabilities,
		})
	end,
}
