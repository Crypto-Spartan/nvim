local function bind(mode, outer_opts)
    local outer_opts = outer_opts or { noremap = true }
    return function(keymap, cmd, opts)
        local opts = vim.tbl_extend('force', outer_opts, opts or {})
        vim.keymap.set(mode, keymap, cmd, opts)
    end
end

nmap = bind('n', { noremap = false })
nnoremap = bind('n')
inoremap = bind('i')
vnoremap = bind('v')
xnoremap = bind('x')
tnoremap = bind('t')


vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- ctrl+c always == <esc>
vim.keymap.set({'n','i','v','x','o'}, '<C-c>', '<esc>', { desc = '<esc>', remap = true })

nnoremap('yY', '^yg_', { desc = 'Yank line without newline char' })

xnoremap('<leader>p', [["_dP]], { desc = 'Paste - no cut to clipboard' })
xnoremap('<leader>P', [["_dp]], { desc = 'Paste (end of line) - no cut to clipboard' })
vim.keymap.set({'n','v','x'}, '<leader>d', [["_d]], { desc = 'Delete - no cut to clipboard' })

-- newlines without entering insert mode
nnoremap('<leader>o', 'o<esc>', { desc = 'Create newline (below) & stay in Normal Mode' })
nnoremap('<leader>O', 'O<esc>', { desc = 'Create newline (above) & stay in Normal Mode' })

nnoremap('<esc>', '<cmd>nohlsearch<cr>', { desc = 'Remove highlghts from searching' })

-- page jumping
-- nnoremap('<C-d>', '<C-d>zz', { desc = 'Jump half-page down, center window on cursor vertically' })
-- nnoremap('<C-u>', '<C-u>zz', { desc = 'Jump half-page up, center window on cursor vertically' })

-- keybinds to make window navigation easier
-- use CTRL+<hjkl> to switch between windows
-- see `:h wincmd` for a list of all window commands
nnoremap('<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
nnoremap('<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
nnoremap('<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
nnoremap('<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
