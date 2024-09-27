return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    keys = {
        {
            '<leader>?',
            function()
                require('which-key').show({ global = false })
            end,
            desc = 'Buffer Local Keymaps (which-key)',
            -- mode = {'n', 'v'}
        },
    },
    opts = {
        preset = 'modern',
        icons = {
            mappings = false,
            rules = false,
            breadcrumb = ">",
            separator = ">",
            ellipsis = ".",
            keys = {
                Up = "^ ",
                Down = "v ",
                Left = "< ",
                Right = "> ",
                C = "C-",
                M = "M-",
                D = "D-",
                S = "S-",
                CR = "<CR>",
                Esc = "<ESC>",
                ScrollWheelDown = "v",
                ScrollWheelUp = "^ ",
                NL = "<nl>",
                BS = "<bs>",
                Space = "<leader>",
                Tab = ">>",
                F1 = "<F1>",
                F2 = "<F2>",
                F3 = "<F3>",
                F4 = "<F4>",
                F5 = "<F5>",
                F6 = "<F6>",
                F7 = "<F7>",
                F8 = "<F8>",
                F9 = "<F9>",
                F10 = "<F10>",
                F11 = "<F11>",
                F12 = "<F12>",
            },
        },
        spec = {
            {
                '<leader>b',
                group = 'Buffers',
                expand = function()
                    require('which-key.extras').expand.buf()
                end
            },
            -- { '<leader>c', group = 'Code' },
            -- { '<leader>d', group = 'Document' },
            { '<leader>w', group = 'Workspace' },
            { '<leader>t', group = 'Toggle' },
            { '<leader>s', group = 'Search' },
            { '<leader>f', group = 'Find' },
            -- { '<leader>g', group = 'Git Hunk', mode = {'n', 'v'} },
            { '<leader>l', group = 'LSP' },

            { 'gt', desc = 'Goto next Tab' },
            { 'gT', desc = 'Goto previous Tab' },
        },
    },
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300 -- in milliseconds
    end,
}


-- sort = { 'group', 'alphanum', 'local', 'order', 'mod' },
