return {
    'lukas-reineke/indent-blankline.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'HiPhish/rainbow-delimiters.nvim',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    keys = {
        { '<leader>ti', '<cmd>IBLTiggle<CR>', desc = 'Toggle Indent Blankline' },
    },
    main = 'ibl',

    config = function()
        local highlight = rainbow_highlights -- defined in rainbow_delims.lua
        local hooks = require('ibl.hooks')

        -- create the highlight groups in the highlight setup hook
        -- this ensures they are reset if the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, 'RainbowRed', { link = 'RainbowDelimiter' })
            vim.api.nvim_set_hl(0, 'RainbowViolet', { link = 'RainbowDelimiterViolet' })
            vim.api.nvim_set_hl(0, 'RainbowGreen', { link = 'RainbowDelimiterGreen' })
            vim.api.nvim_set_hl(0, 'RainbowBlue', { link = 'RainbowDelimiterBlue' })
            vim.api.nvim_set_hl(0, 'RainbowYellow', { link = 'RainbowDelimiterYellow' })
            vim.api.nvim_set_hl(0, 'RainbowCyan', { link = 'RainbowDelimiterCyan' })
            vim.api.nvim_set_hl(0, 'RainbowOrange', { link = 'RainbowDelimiterOrange' })
        end)

        vim.g.rainbow_delimiters = { highlight = highlight }
        require('ibl').setup({
            scope = {
                highlight = highlight,
                include = {
                    node_type = {
                        python = { 'argument_list', 'with_statement', 'parenthesized_expression' },
                        lua = { 'return_statement', 'table_constructor' }
                    }
                }
            }
        })

        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end
}
