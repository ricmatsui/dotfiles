require('nvim-treesitter').install({
    "astro",
    "c",
    "elixir",
    "lua",
    "vim",
    "query",
    "rust",
    "javascript",
    "typescript",
    "tsx",
    "heex"
})

vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        if pcall(vim.treesitter.start, args.buf) then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})

-- lua =vim.treesitter.get_captures_at_cursor()
vim.api.nvim_set_hl(0, "@variable", { link = "@text" })
vim.api.nvim_set_hl(0, "@property", { link = "@text" })
vim.api.nvim_set_hl(0, "TodoDate", { link = "@text" })
vim.api.nvim_set_hl(0, "Pmenu", { link = "Folded" })

-- Print highlights for cursor
-- echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
