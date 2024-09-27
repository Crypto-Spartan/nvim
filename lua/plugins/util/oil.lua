return {
    'stevearc/oil.nvim',
    event = { 'VimEnter' },
    cmd = { 'Lazy' },
    keys = {
        -- nnoremap('<leader>e', vim.cmd.Oil, { desc = 'Open File Explorer (Oil)' })
        {
            '<leader>e',
            vim.cmd.Oil,
            desc = 'Open File Explorer (Oil)'
        },
        {
            '<leader>E',
            '<cmd>tabnew<cr><cmd>Oil<cr>',
            desc = 'Open File Explorer - New Tab (Oil)'
        }
    },
    opts = {
        default_file_explorer = true,
        keymaps = {
            ['<bs>'] = 'actions.parent',
            ['<C-c>'] = { '<nop>', desc = 'Same as <esc>' },
            ['<C-p>'] = {
                callback = function()
                    local oil = require('oil')
                    local entry = oil.get_cursor_entry()
                    if not entry then
                        vim.notify('Could not find entry under cursor', vim.log.levels.ERROR)
                        return
                    end

                    local util = require('oil.util')
                    local winid = util.get_preview_win()

                    if winid then
                        local cur_id = vim.w[winid].oil_entry_id
                        if entry.id == cur_id then
                            vim.api.nvim_win_close(winid, true)
                            if util.is_floating_win() then
                                local layout = require('oil.layout')
                                local win_opts = layout.get_fullscreen_win_opts()
                                vim.api.nvim_win_set_config(0, win_opts)
                            end
                            return
                        end
                    end

                    oil.open_preview({ vertical = true, split = 'botright' })
                end,
                desc = 'Open the entry under the cursor in a preview window, or close the preview window if already open'
            }
        },
        view_options = {
            show_hidden = true,
        },
    }
}
