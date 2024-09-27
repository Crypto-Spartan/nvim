vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- enable 24-bit color
vim.opt.termguicolors = true

-- linenumbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

-- case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.jumpoptions = 'stack,view'

-- decrease update time
vim.opt.updatetime = 250
-- show which line cursor is on
-- vim.opt.cursorline = true
-- minimum num of screen lines to keep above & below cursor
vim.opt.scrolloff = 10

if vim.fn.executable('rg') == 1 then
    vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
    vim.opt.grepformat = '%f:%l:%c:%m'
end
