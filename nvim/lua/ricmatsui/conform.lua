require("conform").setup({
    formatters_by_ft = {
        astro = { "eslint_d", "prettier" },
        rust = { "rustfmt" },
        javascript = { "eslint_d", "prettier" },
        javascriptreact = { "eslint_d", "prettier" },
        json = { "prettier" },
        typescript = { "eslint_d", "prettier" },
        typescriptreact = { "eslint_d", "prettier" },
    },
})

vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true })
end, { desc = "Conform: format" })
