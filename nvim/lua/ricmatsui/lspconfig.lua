local coq = require "coq"
local util = require "lspconfig.util"
require'lspconfig'.astro.setup(coq.lsp_ensure_capabilities({}))
require'lspconfig'.denols.setup(coq.lsp_ensure_capabilities({
    root_dir = util.root_pattern("deno.json", "deno.jsonc"),
}))
require'lspconfig'.pyright.setup{}
require'lspconfig'.ts_ls.setup(coq.lsp_ensure_capabilities({
    root_dir = function(fname)
        if util.root_pattern("deno.json", "deno.jsonc")(fname) then
            return nil
        end
        return util.root_pattern("package.json", "tsconfig.json", "jsconfig.json")(fname)
    end,
    single_file_support = false,
}))
require'lspconfig'.rust_analyzer.setup(coq.lsp_ensure_capabilities({
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

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', function()
    vim.diagnostic.goto_prev({
        severity = { min = vim.diagnostic.severity.INFO }
    })
end)
vim.keymap.set('n', ']d', function()
    vim.diagnostic.goto_next({
        severity = { min = vim.diagnostic.severity.INFO }
    })
end)
vim.keymap.set('n', '<leader>q', function()
vim.diagnostic.setqflist({ severity = { min = vim.diagnostic.severity.WARN } })
    end)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  end,
})
