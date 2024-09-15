return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local api = require('nvim-tree.api')
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        adaptive_size = true,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    })

    vim.keymap.set('n', '<leader>to', function()
      api.tree.focus()
    end)

    vim.keymap.set('n', '<leader>tc', function()
      api.tree.close()
    end)

    vim.cmd [[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]

    vim.keymap.set('n', '<leader>oi', function()
      local node = api.tree.get_node_under_cursor()
      if node.type == 'file' then
        local buffer = vim.api.nvim_create_buf(false, false)
        vim.api.nvim_open_win(buffer, true, {
          relative = 'win',
          row = 2,
          col = 45,
          width = 55,
          height = 30,
          border = 'rounded',
          title = ' Image Preview ',
          title_pos = 'center'
        })
        vim.fn.termopen('viu ' .. node.absolute_path, { term_finish = true })
        vim.cmd [[ setlocal nonumber ]]
        vim.cmd [[ setlocal norelativenumber ]]
        vim.cmd [[ setlocal colorcolumn=0 ]]
        vim.cmd [[ setlocal signcolumn=no ]]
        vim.cmd [[ setlocal nocursorline ]]
        vim.cmd [[ setlocal nolist ]]
      end
      print(node.absolute_path) --
    end)
  end,
}
