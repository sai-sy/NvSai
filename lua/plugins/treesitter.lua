return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "lua", "html", "css", "javascript", "typescript", "go", "c", "markdown", "cpp" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
