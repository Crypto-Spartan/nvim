rainbow_highlights = {
    'RainbowDelimiterRed',
    'RainbowDelimiterBlue',
    'RainbowDelimiterYellow',
    'RainbowDelimiterViolet',
    'RainbowDelimiterGreen',
    'RainbowDelimiterCyan',
    'RainbowDelimiterOrange',
}

return {
    'HiPhish/rainbow-delimiters.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        require('rainbow-delimiters.setup').setup({
            highlight = rainbow_highlights
        })
    end
}

-- default order:
-- 'RainbowDelimiterRed',
-- 'RainbowDelimiterYellow',
-- 'RainbowDelimiterBlue',
-- 'RainbowDelimiterOrange',
-- 'RainbowDelimiterGreen',
-- 'RainbowDelimiterViolet',
-- 'RainbowDelimiterCyan',
