require('telescope').load_extension('fzf')
require('telescope').load_extension 'telescope-tabs'

local function get_title(bufnr)
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 5, false)
  return table.concat(lines, '\n'):match('title:%s*([^\n]+)')
end

require('telescope-tabs').setup {
  entry_formatter = function(_, buffer_ids, file_names, _, _)
    return get_title(buffer_ids[1]) or file_names[1]
  end,
  entry_ordinal = function(_, buffer_ids, file_names, _, _)
    return (get_title(buffer_ids[1]) or '') .. ' ' .. table.concat(file_names, ' ')
  end,
}

vim.keymap.set('n', '<leader>T', '<cmd>Telescope<cr>', { desc = 'Open Telescope' })
vim.keymap.set('n', '<C-g>', require('telescope-tabs').list_tabs, { desc = 'List tabs' })
