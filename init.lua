--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

        -- Configure AstroNvim updates
    updater = {
        remote = "origin", -- remote to use
        channel = "nightly", -- "stable" or "nightly"
        version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
        branch = "main", -- branch name (NIGHTLY ONLY)
        commit = nil, -- commit hash (NIGHTLY ONLYe
        pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
        skip_prompts = false, -- skip prompts about breaking changes
        show_changelog = true, -- show the changelog after performing an update
        auto_reload = false, -- automatically reload and sync packer after a successful update
        auto_quit = false, -- automatically quit the current session after a successful update
        -- remotes = { -- easily add new remotes to track
        --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
        --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
        --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
        -- },
    },

        -- Set colorscheme to use
        colorscheme = "gruvbox",

        -- Add highlight groups in any theme
        highlights = {
                gruvbox = {
                        StatusLine = { fg = "#ebdbb2", bg = "#3c3836" },
                },
        },

        -- set vim options here (vim.<first_key>.<second_key> = value)
        options = {
                opt = {
                        -- set to true or false etc.
                        relativenumber = false, -- sets vim.opt.relativenumber
                        number = true, -- sets vim.opt.number
                        spell = false, -- sets vim.opt.spell
                        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
                        wrap = true, -- sets vim.opt.wrap
                        linebreak = true,
                        showbreak = "▹▹"
                },
                g = {
                        mapleader = " ", -- sets vim.g.mapleader
                        autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
                        cmp_enabled = true, -- enable completion at start
                        autopairs_enabled = true, -- enable autopairs at start
                        diagnostics_enabled = true, -- enable diagnostics at start
                        status_diagnostics_enabled = true, -- enable diagnostics in statusline
                        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
                        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
                        heirline_bufferline = true, -- enable new heirline based bufferline (requires :PackerSync after changing)
                        vimwiki_global_ext = 0,
                        vimwiki_list = { {
                                path = '~/vimwiki',
                                template_path = '~/vimwiki/templates/',
                                template_default = 'default',
                                syntax = 'markdown',
                                ext = '.md',
                                path_html = '~/vimwiki/site_html/',
                                custom_wiki2html = 'vimwiki_markdown',
                                html_filename_parameterization = 1,
                                template_ext = '.tpl',
                        } },
                        firenvim_config = { localSettings = { ['.*'] = { takeover = "never" } } },
                        rnvimr_enable_picker = 1,
                        -- rnvimr_ex_enable = 1,
                        rnvimr_presets = { { width = 0.900, height = 0.800 } },
                        rnvimr_action = {
                                ['<C-t>'] = 'NvimEdit tabedit',
                                ['<C-x>'] = 'NvimEdit split',
                                ['<C-v>'] = 'NvimEdit vsplit',
                                gw = 'JumpNvimCwd',
                                yw = 'EmitRangerCwd'
                        },
                        user_emmet_leader_key = '<C-z',
                        user_emmet_install_global = 1
                    },
        },
        -- If you need more control, you can use the function()...end notation
        -- options = function(local_vim)
        --   local_vim.opt.relativenumber = true
        --   local_vim.g.mapleader = " "
        --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
        --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
        --
        --   return local_vim
        -- end,

        -- Set dashboard header
        header = {
                "    ╳╳╳    ╳╳ ╳╳    ╳╳ ╳╳ ╳╳╳    ╳╳╳",
                "    ╳╳╳╳   ╳╳ ╳╳    ╳╳ ╳╳ ╳╳╳╳  ╳╳╳╳",
                "    ╳╳ ╳╳  ╳╳ ╳╳    ╳╳ ╳╳ ╳╳ ╳╳╳╳ ╳╳",
                "    ╳╳  ╳╳ ╳╳  ╳╳  ╳╳  ╳╳ ╳╳  ╳╳  ╳╳",
                "    ╳╳   ╳╳╳╳   ╳╳╳╳   ╳╳ ╳╳      ╳╳",
        },


        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
                virtual_text = true,
                underline = true,
        },

        -- Extend LSP configuration
        lsp = {
                -- enable servers that you already have installed without mason
                servers = {
                        -- "pyright"
                },
                formatting = {
                        -- control auto formatting on save
                        format_on_save = {
                                enabled = true, -- enable or disable format on save globally
                                allow_filetypes = { -- enable format on save for specified filetypes only
                                        -- "go",
                                },
                                ignore_filetypes = { -- disable format on save for specified filetypes
                                        -- "python",
                                },
                        },
                        disabled = { -- disable formatting capabilities for the listed language servers
                                -- "sumneko_lua",
                        },
                        timeout_ms = 1000, -- default format timeout
                        -- filter = function(client) -- fully override the default formatting function
                        --   return true
                        -- end
                },
                -- easily add or disable built in mappings added during LSP attaching
                mappings = {
                        n = {
                                -- ["<leader>lf"] = false -- disable formatting keymap
                                ["K"] = false,
                                ["<leader>k"] = { function() vim.lsp.buf.hover() end, desc = "Hover symbol details" }

                        },
                },
                -- add to the global LSP on_attach function
                -- on_attach = function(client, bufnr)
                -- end,

                -- override the mason server-registration function
                -- server_registration = function(server, opts)
                --   require("lspconfig")[server].setup(opts)
                -- end,

                -- Add overrides for LSP server settings, the keys are the name of the server
                ["server-settings"] = {
                        -- example for addings schemas to yamlls
                        -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
                        --   settings = {
                        --     yaml = {
                        --       schemas = {
                        --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
                        --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                        --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                        --       },
                        --     },
                        --   },
                        -- },
                },
        },

        -- Mapping data with "desc" stored directly by vim.keymap.set().
        --
        -- Please use this mappings table to set keyboard mapping since this is the
        -- lower level configuration and more robust one. (which-key will
        -- automatically pick-up stored data by this setting.)
        mappings = {
                -- first key is the mode
                n = {
                        -- second key is the lefthand side of the map
                        -- mappings seen under group name "Buffer"
                        -- ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
                        -- ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
                        -- ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
                        -- ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
                        -- quick save
                        ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
                        ["<leader>w"] = false,
                        ["<leader>rr"] = { ":RnvimrToggle<CR>", desc = "Ranger File Browser", silent = true },
                        ["<leader>j"] = { "J", desc = "Merge line up", noremap = true },
                        ["<S-h>"] = { "^" },
                        ["<S-l>"] = { "$" },
                        ["<S-j>"] = { "5j" },
                        ["<S-k>"] = { "5k" },
                },
                v = {
                        ["<leader>j"] = { "J", desc = "Merge line up", noremap = true },
                        ["<S-h>"] = { "^" },
                        ["<S-l>"] = { "$" },
                        ["<S-j>"] = { "5j" },
                        ["<S-k>"] = { "5k" },
                },
                t = {
                        -- setting a mapping to false will disable it]
                        -- ["<esc>"] = false,
                },
        },

        -- Configure plugins
        plugins = {
                init = {
                        -- You can disable default plugins as follows:
                        -- ["goolord/alpha-nvim"] = { disable = true },
                        ["max397574/better-escape.nvim"] = { disable = true },

                        -- You can also add new plugins here as well:
                        -- Add plugins, the packer syntax without the "use"
                        -- { "andweeb/presence.nvim" },
                        -- {
                        --   "ray-x/lsp_signature.nvim",
                        --   event = "BufRead",
                        --   config = function()
                        --     require("lsp_signature").setup()
                        --   end,
                        -- },
                        { "ellisonleao/gruvbox.nvim" },
                        { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end },
                        { 'tpope/vim-surround' },
                        { 'tpope/vim-repeat' },
                        { 'vimwiki/vimwiki' },
                        { 'mattn/emmet-vim' },
                        { 'kevinhwang91/rnvimr' },
                        { 'jabirali/vim-tmux-yank' },
                        { 'mg979/vim-visual-multi' },

                        -- We also support a key value style plugin definition similar to NvChad:
                        -- ["ray-x/lsp_signature.nvim"] = {
                        --   event = "BufRead",
                        --   config = function()
                        --     require("lsp_signature").setup()
                        --   end,
                        -- },
                },
                -- All other entries override the require("<key>").setup({...}) call for default plugins
                ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
                        -- config variable is the default configuration table for the setup function call
                        local null_ls = require "null-ls"

                        -- Check supported formatters and linters
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
                        config.sources = {
                                -- Set a formatter
                        }
                        return config -- return final config table
                end,
                treesitter = { -- overrides `require("treesitter").setup(...)`
                        -- ensure_installed = { "lua" },
                        auto_install = true
                },
                -- use mason-lspconfig to configure LSP installations
                ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
                        -- ensure_installed = { "sumneko_lua" },
                },
                -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
                ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
                        -- ensure_installed = { "prettier", "stylua" },
                        prettier = function()
                                require("null-ls").register(require("null-ls").builtins.formatting.prettier.with({
                                        condition = function(utils)
                                                return utils.root_has_file("package.json") or
                                                    utils.root_has_file(".prettierrc") or
                                                    utils.root_has_file(".prettierrc.json") or
                                                    utils.root_has_file(".prettierrc.js")
                                        end
                                }))
                        end,
                },
                ["mason-nvim-dap"] = { -- overrides `require("mason-nvim-dap").setup(...)`
                        -- ensure_installed = { "python" },
                },
                gruvbox = {
                        undercurl = true,
                        underline = true,
                        bold = true,
                        italic = true,
                        strikethrough = true,
                        invert_selection = true,
                        invert_signs = false,
                        invert_tabline = false,
                        invert_intend_guides = false,
                        inverse = false,
                        contrast = "hard", -- can be "hard", "soft" or empty string
                        palette_overrides = {},
                        overrides = {},
                        dim_inactive = true,
                        transparent_mode = true,
                        clipboard = false,
                },
                ["neo-tree"] = {
                        filesystem = {
                                filtered_items = {
                                        visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
                                        hide_dotfiles = false,
                                        hide_gitignored = true,
                                },
                        },
                },
        },

        -- LuaSnip Options
        luasnip = {
                -- Extend filetypes
                filetype_extend = {
                        -- javascript = { "javascriptreact" },
                },
                -- Configure luasnip loaders (vscode, lua, and/or snipmate)
                vscode = {
                        -- Add paths for including more VS Code style snippets in luasnip
                        paths = {},
                },
        },

        -- CMP Source Priorities
        -- modify here the priorities of default cmp sources
        -- higher value == higher priority
        -- The value can also be set to a boolean for disabling default sources:
        -- false == disabled
        -- true == 1000
        cmp = {
                source_priority = {
                        nvim_lsp = 1000,
                        luasnip = 750,
                        buffer = 500,
                        path = 250,
                },
        },

        -- Customize Heirline options
        heirline = {
                -- -- Customize different separators between sections
                -- separators = {
                --   tab = { "", "" },
                -- },
                -- -- Customize colors for each element each element has a `_fg` and a `_bg`
                -- colors = function(colors)
                --   colors.git_branch_fg = astronvim.get_hlgroup "Conditional"
                --   return colors
                -- end,
                -- -- Customize attributes of highlighting in Heirline components
                -- attributes = {
                --   -- styling choices for each heirline element, check possible attributes with `:h attr-list`
                --   git_branch = { bold = true }, -- bold the git branch statusline component
                -- },
                -- -- Customize if icons should be highlighted
                -- icon_highlights = {
                --   breadcrumbs = false, -- LSP symbols in the breadcrumbs
                --   file_icon = {
                --     winbar = false, -- Filetype icon in the winbar inactive windows
                --     statusline = true, -- Filetype icon in the statusline
                --   },
                -- },
        },

        -- Modify which-key registration (Use this with mappings table in the above.)
        ["which-key"] = {
                -- Add bindings which show up as group name
                register = {
                        -- first key is the mode, n == normal mode
                        n = {
                                -- second key is the prefix, <leader> prefixes
                                ["<leader>"] = {
                                        -- third key is the key to bring up next level and its displayed
                                        -- group name in which-key top level menu
                                        ["b"] = { name = "Buffer" },
                                        ["w"] = { name = "vimwiki" }
                                },
                        },
                },
        },

        -- This function is run last and is a good place to configuring
        -- augroups/autocommands and custom filetypes also this just pure lua so
        -- anything that doesn't fit in the normal config locations above can go here
        polish = function()
                -- Set up custom filetypes
                -- vim.filetype.add {
                --   extension = {
                --     foo = "fooscript",
                --   },
                --   filename = {
                --     ["Foofile"] = "fooscript",
                --   },
                --   pattern = {
                --     ["~/%.config/foo/.*"] = "fooscript",
                --   },
                -- }
                -- vimscript dump
                vim.cmd([[
    ]]           )
        end,
}

return config
