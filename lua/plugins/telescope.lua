return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.9',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>p', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

      vim.keymap.set('n', '<leader>faf', function()
        builtin.find_files({ hidden = true, no_ignore = true })
      end, {})
      vim.keymap.set('n', '<leader>fag', function()
        builtin.live_grep({ hidden = true, no_ignore = true })
      end, {})

      vim.keymap.set('n', '<leader>fhf', function()
        builtin.find_files({ hidden = true })
      end, {})
      vim.keymap.set('n', '<leader>fhg', function()
        builtin.live_grep({ hidden = true })
      end, {})

      vim.keymap.set('n', '<leader>fif', function()
        builtin.find_files({ no_ignore = true })
      end, {})
      vim.keymap.set('n', '<leader>fig', function()
        builtin.live_grep({ no_ignore = true })
      end, {})
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup ({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  },
}
