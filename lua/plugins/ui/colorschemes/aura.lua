return {
    'daltonmenezes/aura-theme',
    lazy = true,
    keys = {
        {
            '<leader>fC',
            '<cmd>Telescope colorscheme initial_mode=normal<cr>',
            desc = 'Colorschemes with Preview'
        },
    },
    priority = 1000,
    config = function(plugin)
        vim.opt.rtp:append(plugin.dir .. '/packages/neovim')
        -- vim.cmd('colorscheme aura-dark')
    end
}
