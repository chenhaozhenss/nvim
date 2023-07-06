return {
	"mxsdev/nvim-dap-vscode-js",
	config = function()
		require("dap-vscode-js").setup({
			node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
       debugger_path = vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter',
	--		debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
			adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
			-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
			-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
			-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
		})
		-- language config
		for _, language in ipairs({ "typescript", "javascript" ,"html"}) do
			dap.configurations[language] = {
				{
					type = "pwa-chrome",
					name = "Attach - Remote Debugging",
					request = "attach",
					program = "${file}",
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
					protocol = "inspector",
					port = 9222,
					webRoot = "${workspaceFolder}",
				},
				{
					type = "pwa-chrome",
					name = "Launch Chrome",
					request = "launch",
					url = "http://localhost:8080",
				},
			}
		end
	end,
}
