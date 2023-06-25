return{
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install",
  ft = "markdown",
  config = function()
    vim.g.mkdp_auto_start = 1
    vim.g.mkdp_theme = 'dark'
    vim.g.mkdp_browser = 'safari'

  end,
}
