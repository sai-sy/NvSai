return {
  "akinsho/bufferline.nvim",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local function diagnostics_indicator(count, level)
      if level:match("error") then
        return " " .. count
      end
      return ""
    end

    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = diagnostics_indicator,
      },
    })

    local function link_error_highlights()
      local groups = {
        "BufferLineError",
        "BufferLineErrorVisible",
        "BufferLineErrorSelected",
        "BufferLineErrorDiagnostic",
        "BufferLineErrorDiagnosticVisible",
        "BufferLineErrorDiagnosticSelected",
      }
      for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, { link = "DiagnosticError" })
      end
    end

    link_error_highlights()
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = link_error_highlights,
    })
    vim.keymap.set('n', '<tab>', ':BufferLineCycleNext<CR>', {})
    vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', {})
  end
 }

    -- nnoremap <silent>[b :BufferLineCycleNext<CR>
    -- nnoremap <silent>b] :BufferLineCyclePrev<CR>
