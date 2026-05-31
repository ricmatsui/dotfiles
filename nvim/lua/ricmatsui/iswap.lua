require('iswap').setup{
    flash_style = false,
    move_cursor = true,
}
vim.keymap.set("n", "<leader>s", function()
    vim.cmd("ISwapWithRight")
end)
vim.keymap.set("n", "<leader>S", function()
    vim.cmd("ISwapWithLeft")
end)
