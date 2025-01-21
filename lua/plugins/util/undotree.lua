return {
    'mbbill/undotree',
    dependencies = { 'folke/snacks.nvim' },
    lazy = true,
    cmd = 'UndotreeToggle',
    init = function()
        vim.g.undotree_SetFocusWhenToggle = 1

        -- snacks toggle setup
        vim.api.nvim_create_autocmd('User', {
            group = vim.api.nvim_create_augroup('SnacksToggle', { clear = false }),
            pattern = 'LazyFileOpen',
            once = true,
            callback = function()
                local undotree_snacks_enabled = false
                local toggle_opts = {
                    name = 'UndoTree',
                    get = function()
                        return undotree_snacks_enabled
                    end,
                    set = function(state)
                        if state then
                            undotree_snacks_enabled = true
                            vim.cmd('UndotreeToggle')
                        else
                            undotree_snacks_enabled = false
                            vim.cmd('UndotreeToggle')
                        end
                    end,
                }
                package.loaded.snacks.toggle.new(toggle_opts):map('<leader>tu')
            end
        })
    end,
}
