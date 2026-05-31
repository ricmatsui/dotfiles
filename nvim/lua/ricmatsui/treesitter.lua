require'nvim-treesitter.configs'.setup {
    ensure_installed = {
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
    },

    highlight = {
        enable = true,
    },

    incremental_selection = {
        enable = true,
    },

    indent = {
        enable = true,
    },
}

-- lua =vim.treesitter.get_captures_at_cursor()
vim.api.nvim_set_hl(0, "@variable", { link = "@text" })
vim.api.nvim_set_hl(0, "@property", { link = "@text" })
vim.api.nvim_set_hl(0, "TodoDate", { link = "@text" })
vim.api.nvim_set_hl(0, "Pmenu", { link = "Folded" })

-- Print highlights for cursor
-- echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
