return {
  "akinsho/bufferline.nvim",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("bufferline").setup({
      options = { diagnostics = "nvim_lsp" }
    })
    vim.keymap.set('n', '<tab>', ':BufferLineCycleNext<CR>', {})
    vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', {})
  end
 }

    -- nnoremap <silent>[b :BufferLineCycleNext<CR>
    -- nnoremap <silent>b] :BufferLineCyclePrev<CR>
