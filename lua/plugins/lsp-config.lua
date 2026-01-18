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
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "gopls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- 0.11+ style configs (no require("lspconfig").xxx.setup)
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})

			vim.lsp.config("html", {
				capabilities = capabilities,
			})

			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
			})

			-- Enable servers
			vim.lsp.enable({ "lua_ls", "html", "ts_ls" })

			-- Buffer-local LSP keymaps when a server attaches
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "<C-k><C-i>", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "<C-F12>", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "<F12>", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				end,
			})

			vim.diagnostic.config({ virtual_text = true })
		end,
	},
}
