local coq = require "coq"

vim.lsp.config('astro', coq.lsp_ensure_capabilities({}))

vim.lsp.config('denols', coq.lsp_ensure_capabilities({
    root_markers = { 'deno.json', 'deno.jsonc' },
}))

vim.lsp.config('pyright', {})

vim.lsp.config('ts_ls', coq.lsp_ensure_capabilities({
    root_dir = function(bufnr, on_dir)
        if vim.fs.root(bufnr, { 'deno.json', 'deno.jsonc' }) then
            return
        end
        local dir = vim.fs.root(bufnr, { 'package.json', 'tsconfig.json', 'jsconfig.json' })
        if dir then
            on_dir(dir)
        end
    end,
}))

vim.lsp.config('rust_analyzer', coq.lsp_ensure_capabilities({
    settings = {
        ['rust-analyzer'] = {
            files = {
                excludeDirs = {
                    ".venv",
                    "ansible_collections",
                    "pi",
                }
            }
        }
    }
}))

vim.lsp.enable({ 'astro', 'denols', 'pyright', 'ts_ls', 'rust_analyzer' })

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

vim.diagnostic.config({
    jump = {
        severity = { min = vim.diagnostic.severity.INFO },
        on_jump = function(_, bufnr)
            vim.diagnostic.open_float({ bufnr = bufnr, scope = 'cursor', focus = false })
        end,
    },
})

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', function()
    vim.diagnostic.setqflist({ severity = { min = vim.diagnostic.severity.WARN } })
end)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  end,
})
