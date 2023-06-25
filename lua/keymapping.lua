local map = vim.api.nvim_set_keymap
local opt = { silent = true, noremap = true }
map("n", "<leader>e", ":Neotree toggle<cr>", opt)
map("n", "<leader>F", "<cmd>lua vim.lsp.buf.format()<cr>", opt)
map("n", "<leader>f", ":Telescope find_files<cr>", opt)
map("n", "<c-f>", ":Telescope live_grep<cr>", opt)
map("n", "<c-p>", ":Telescope neoclip initial_mode=normal<cr>", opt)
---------------------------------------------------------
map("n", "<leader>m", ":Telescope media_files<cr>", opt)
map("n", "<leader>i", ":TranslateW<cr>", opt)
map("n", "<leader>o", ":SymbolsOutline<cr>", opt)
map("n", "<leader>p", ":Telekasten panel<cr>", opt)
map("i", "<c-j>", "", opt)
map("i", "<c-k>", "", opt)
map("i", "<c-l>", "", opt)
map("n", "s", "", opt)
map("n", "H", "g0", opt)
map("n", "L", "g$", opt)
map("v", "H", "g0", opt)
map("v", "L", "g$", opt)
map("n", "J", "", opt)
map("n", "K", "", opt)
map("n", "U", ":redo<cr>", opt)
map("n", "sv", ":vsp<cr>", opt)
map("n", "sh", ":sp<cr>", opt)
map("n", "sc", "<c-w>c ", opt)
map("n", "so", "<c-w>o", opt)

----------- move focus ------------------
map("n", "<M-h>", "<c-w>h", opt)
map("n", "<M-l>", "<c-w>l", opt)
map("n", "<M-k>", "<c-w>k", opt)
map("n", "<M-j>", "<c-w>j", opt)
------------- switch buffer -------------------
map("n", "<c-9>", ":BufferLineCyclePrev<cr>", opt)
map("n", "<c-0>", ":BufferLineCycleNext<cr>", opt)
map("n", "<leader>w", ":BufferLinePickClose<cr>", opt)
map("n", "<c-w>", ":bdelete <cr>", opt)
--------------close buffer--------------------
--map('n','<c-w>',':BufferLinePickClose<cr>',opt)
-------------leap--------------------
map("n", "f", "<Plug>(leap-forward-to)", opt)
map("n", "F", "<Plug>(leap-backward-to)", opt)
--------------corsur multi-----------------



--------------Telescope-----------------
---------------------------cmp------------------------
map("n", "<leader><leader>m", "<Plug>MarkdownPreviewToggle<cr>", opt)
-------lsp-----------------------
vim.keymap.set("n", "gp", vim.diagnostic.open_float)
vim.keymap.set("n", "gk", vim.diagnostic.goto_prev)
vim.keymap.set("n", "gj", vim.diagnostic.goto_next)
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	end,
})

vim.keymap.set("n", "<leader>x", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })

--------------dap------------
map('n','<leader>d',":lua require'dap'.toggle_breakpoint()<cr>",opt)
map('n','<leader>dc',":lua require'dap'.continue()<cr>",opt)
map('n','<leader>ds',":lua require'dap'.step_over()<cr>",opt)
map('n','<leader>di',":lua require'dap'.step_into()<cr>",opt)
map('n','<leader>do',":lua require'dap'.repl.open()<cr>",opt)


