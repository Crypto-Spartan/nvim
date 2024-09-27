return {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    cmd = 'Telescope',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            -- if encountering errors, see telescope-fzf-native README for installation instructions
            'nvim-telescope/telescope-fzf-native.nvim',

            -- `build` is used to run some command when the plugin is installed/updated
            -- this is only run then, not ever time neovim starts up
            build = 'make',
            -- build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',

            -- `cond` is a condition used to determine whether this plugin should be installed & loaded
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        }
    },
    keys = function()
        local function ts_actions()
            return require('telescope.actions')
        end
        local function ts_builtin()
            return require('telescope.builtin')
        end
        local function ts_utils()
            return require('telescope.utils')
        end

        local function get_nvim_root_dir()
            return vim.fn.getcwd()
        end
        local function get_cwd()
            return ts_utils().buffer_dir()
        end

        local function current_buffer_fuzzy_find()
            return ts_builtin().current_buffer_fuzzy_find(
                require('telescope.themes').get_dropdown({
                    winblend = 10,
                    previewer = false,
                })
            )
        end

        local function ts_buffers_cmd()
            vim.cmd('Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal')
        end

        return {
            {
                '<leader>/',
                function()
                    current_buffer_fuzzy_find()
                end,
                desc = 'Fuzzy find in current buffer'
            },
            {
                '<leader>:',
                '<cmd>Telescope command_history<cr>',
                desc = 'Command History'
            },

            -- buffers
            {
                '<leader>,',
                function()
                    ts_buffers_cmd()
                end,
                desc = 'Open Buffers'
            },
            {
                '<leader>bb',
                function()
                    ts_buffers_cmd()
                end,
                desc = 'Open Buffers'
            },
            {
                '<leader>fb',
                function()
                    ts_buffers_cmd()
                end,
                desc = 'Open Buffers'
            },

            -- find
            {
                '<leader>f/',
                function()
                    current_buffer_fuzzy_find()
                end,
                desc = 'Fuzzy find in current buffer'
            },
            {
                '<leader>fa',
                '<cmd>Telescope autocommands<cr>',
                desc = 'Auto Commands'
            },
            {
                '<leader>fc',
                '<cmd>Telescope commands<cr>',
                desc = 'Commands'
            },
            {
                '<leader>fC',
                '<cmd>Telescope colorscheme initial_mode=normal<cr>',
                desc = 'Colorschemes with Preview'
            },
            {
                '<leader>fd',
                '<cmd>Telescope diagnostics bufnr=0<cr>',
                desc = 'Diagnostics - Document'
            },
            {
                '<leader>fD',
                '<cmd>Telescope diagnostics<cr>',
                desc = 'Diagnostics - Workspace'
            },
            {
                '<leader>fh',
                function()
                    ts_builtin().help_tags({
                        attach_mappings = function(_, map)
                            map({'i','n'}, '<cr>', ts_actions().select_tab)
                            return true
                        end
                    })
                end,
                desc = 'Help Tags'
            },
            {
                '<leader>fH',
                '<cmd>Telescope highlights<cr>',
                desc = 'Highlight Groups'
            },
            {
                '<leader>ff',
                function()
                    local path = get_cwd()
                    ts_builtin().find_files({
                        cwd = path,
                        prompt_title = 'Files in' .. path,
                    })
                end,
                desc = 'Files (cwd)'
            },
            {
                '<leader>fF',
                function()
                    local path = get_nvim_root_dir()
                    ts_builtin().find_files({
                        cwd = path,
                        prompt_title = 'Files in' .. path,
                    })
                end,
                desc = 'Files (nvim root dir)'
            },
            {
                '<leader>fk',
                '<cmd>Telescope keymaps<cr>',
                desc = 'Keymaps'
            },
            {
                '<leader>fn',
                function()
                    local path = vim.fn.stdpath('config')
                    ts_builtin().find_files({
                        cwd = path,
                        prompt_title = 'Files in' .. path,
                    })
                end,
                desc = 'Neovim Config Files (Find)'
            },
            {
                '<leader>fr',
                '<cmd>Telescope resume initial_mode=normal<cr>',
                desc = 'Telescope Resume'
            },
            {
                '<leader>ft',
                '<cmd>Telescope builtin<cr>',
                desc = 'Telescope Functions'
            },

            -- search
            {
                '<leader>s"',
                '<cmd>Telescope registers<cr>',
                desc = 'Registers'
            },
            {
                '<leader>sd',
                '<cmd>Telescope diagnostics bufnr=0<cr>',
                desc = 'Diagnostics - Document'
            },
            {
                '<leader>sD',
                '<cmd>Telescope diagnostics<cr>',
                desc = 'Diagnostics - Workspace'
            },
            {
                '<leader>sf',
                function()
                    local path = get_cwd()
                    ts_builtin().live_grep({
                        cwd = path,
                        prompt_title = 'Grep in' .. path,
                    })
                end,
                desc = 'Grep (cwd)'
            },
            {
                '<leader>sF',
                function()
                    local path = get_nvim_root_dir()
                    ts_builtin().live_grep({
                        cwd = path,
                        prompt_title = 'Grep in' .. path,
                    })
                end,
                desc = 'Grep (nvim root dir)'
            },
            {
                '<leader>sj',
                '<cmd>Telescope jumplist<cr>',
                desc = 'Jumplist'
            },
            {
                '<leader>sl',
                '<cmd>Telescope loclist<cr>',
                desc = 'Location List'
            },
            {
                '<leader>sm',
                '<cmd>Telescope man_pages<cr>',
                desc = 'Man Pages'
            },
            {
                '<leader>sn',
                function()
                    local path = vim.fn.stdpath('config')
                    ts_builtin().live_grep({
                        cwd = path,
                        prompt_title = 'Grep in' .. path,
                    })
                end,
                desc = 'Neovim Config Files (Grep)'
            },
            {
                '<leader>so',
                function()
                    ts_builtin().live_grep({
                        grep_in_open_files = true,
                        prompt_title = 'Grep in Open Files',

                    })
                end,
                desc = 'Grep in Open Files'
            },
            {
                '<leader>sq',
                '<cmd>Telescope quickfix<cr>',
                desc = 'Quickfix List'
            },
            {
                '<leader>sr',
                '<cmd>Telescope resume initial_mode=normal<cr>',
                desc = 'Telescope Resume'
            },
            {
                '<leader>sv',
                '<cmd>Telescope vim_options<cr>',
                desc = 'Vim Options'
            },
            {
                '<leader>sw',
                function()
                    local path = get_cwd()
                    ts_builtin().live_grep({
                        cwd = path,
                        prompt_title = 'Grep in' .. path,
                        word_match = '-w',
                        initial_mode = 'normal'
                    })
                end,
                desc = 'Grep current Word (cwd)',
                mode = {'n', 'v'}
            },
            {
                '<leader>sW',
                function()
                    local path = get_nvim_root_dir()
                    ts_builtin().live_grep({
                        cwd = path,
                        prompt_title = 'Grep in' .. path,
                        word_match = '-w',
                        initial_mode = 'normal'
                    })
                end,
                desc = 'Grep current Word (nvim root dir)',
                mode = {'n', 'v'}
            },
        }
    end,
    config = function()
        -- 2 important keymaps in telescope are:
        --  - insert mode: <C-/>
        --  - normal mode: ?
        -- these open a window that shows all of the keymaps for the current telescope picker

        -- [ Configure Telescope ]
        -- see `:help telescope` & `:help telescope.setup()`

        local telescope = require('telescope')
        local actions = require('telescope.actions')

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ['<C-c>'] = { '<esc>', type = 'command' },
                        ['<C-k>'] = actions.move_selection_previous,
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
                        ['<Left>'] = actions.preview_scrolling_left,
                        ['<Right>'] = actions.preview_scrolling_right,
                        ['<Up>'] = actions.preview_scrolling_up,
                        ['<Down>'] = actions.preview_scrolling_down,
                    },
                },
            },
            pickers = {
                colorscheme = {
                    enable_preview = true,
                },
            },
            extensions = { 'fzf' },
        })

        telescope.load_extension('fzf')
    end
}

