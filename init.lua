-- if nvim is started with `PROF=1 nvim`, this will run to profile the startup
if vim.env.PROF then
    local snacks = vim.fn.stdpath('data') .. '/lazy/snacks.nvim'
    vim.opt.rtp:append(snacks)
    require('snacks.profiler').startup({
        startup = {
            event = 'VeryLazy', -- stop profiler on this event (default is `VimEnter`)
            after = true
        }
    })
end

-- require('log_events')
require('config')
