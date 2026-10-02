return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()

			local registry = require("mason-registry")

			local function ensure_installed(package_name)
				local package = registry.get_package(package_name)
				if not package:is_installed() then
					package:install()
				end
			end

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "go",
				callback = function()
					ensure_installed("gopls")
				end,
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
				},
				callback = function()
					ensure_installed("typescript-language-server")
					ensure_installed("eslint-lsp")
				end,
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "html",
				callback = function()
					ensure_installed("html-lsp")
				end,
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "css", "scss", "less" },
				callback = function()
					ensure_installed("css-lsp")
				end,
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "python",
				callback = function()
					ensure_installed("pyright")
				end,
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "lua",
				callback = function()
					ensure_installed("lua-language-server")
				end,
			})
		end,
		dependencies = {
			"neovim/nvim-lspconfig",
		},
	},
}
