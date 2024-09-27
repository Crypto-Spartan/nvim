return {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter' },
    dependencies = {
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
        require('luasnip.loaders.from_vscode').lazy_load()

        cmp.setup({
            completion = {
                completeopt = 'menu,menuone,preview,noselect'
            },
            snippet = { -- configure how nvim-cmp interacts with snippet engine
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-k>']     = cmp.mapping.select_prev_item(),
                ['<C-j>']     = cmp.mapping.select_next_item(),
                ['<C-u>']     = cmp.mapping.scroll_docs(-4),
                ['<C-d>']     = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(), --show completion suggestion
                ['<C-y>']     = cmp.mapping.confirm({ select = true }),
                ['<CR>']      = cmp.mapping.confirm({ select = false }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'path' },
                { name = 'luasnip' },
            })
        })
    end,
}
