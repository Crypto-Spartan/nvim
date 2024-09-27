return {
    'tris203/precognition.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    keys = {
        {
            '<leader>th',
            function()
                if require('precognition').toggle() then
                    vim.notify('precognition on')
                else
                    vim.notify('precognition off')
                end
            end,
            desc = 'Hints'
        },
        {
            '<leader>tH',
            function()
                vim.notify('precognition on until next cursor movement')
                require('precognition').peek()
            end,
            desc = 'Hints (temporary)'
        },
    }
}
