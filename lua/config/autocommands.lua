-- highlight when yanking text
-- see `:h vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
    callback = function()
        vim.highlight.on_yank({
            timeout=400,
            priority=300
        })
    end
})


-- add line numbers when in neovim help docs
-- see `:help nvim_create_autocmd()`
vim.api.nvim_create_autocmd('FileType', {
    desc = 'Add line numbers in neovim docs/help files',
    group = vim.api.nvim_create_augroup('DocsLineNums', { clear = true }),
    pattern = { 'help' },
    callback = function()
        vim.opt.number = true
        vim.opt.relativenumber = true
    end
})

-- replace `h` with `tabh h` in command mode
vim.cmd[[ cabbrev h tab h ]]
