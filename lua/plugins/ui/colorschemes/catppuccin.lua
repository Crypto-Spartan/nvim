return {
    'catppuccin/nvim',
    name = 'catppuccin',
    keys = {
        {
            '<leader>fC',
            '<cmd>Telescope colorscheme initial_mode=normal<cr>',
            desc = 'Colorschemes with Preview'
        },
    },
    lazy = true,
    -- priority = 1000,
    opts = {
        transparent_background = false,
    }
}
