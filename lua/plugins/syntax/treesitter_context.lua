return {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = { 'BufReadPre', 'BufNewFile' },
    keys = {
        { '<leader>tc', '<cmd>TSContextToggle<CR>', desc = 'Toggle TS Context' },
    },
    opts = {
        max_lines = 12,
        multiline_theshold = 3
    }
}
