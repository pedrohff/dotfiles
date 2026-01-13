vim.keymap.set("n", "<leader>e", "<Cmd>Neotree position=current<CR>")
return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false, -- neo-tree will lazily load itself
        init = function()
            vim.api.nvim_create_autocmd('BufEnter', {
                -- make a group to be able to delete it later
                group = vim.api.nvim_create_augroup('NeoTreeInit', {clear = true}),
                callback = function()
                    local f = vim.fn.expand('%:p')
                    if vim.fn.isdirectory(f) ~= 0 then
                        vim.cmd('Neotree current dir=' .. f)
                        -- neo-tree is loaded now, delete the init autocmd
                        vim.api.nvim_clear_autocmds{group = 'NeoTreeInit'}
                    end
                end
            })
            -- keymaps
        end,
        opts = {
            name = {
                use_git_status_colors = false,
                highlight = "NeoTreeFileName",
            },
            window = {
                mappings = {
                    ["["] = "expand_all_subnodes",
                    ["]"] = "close_all_nodes"
                }
            },
            filesystem = {
                position = "current",
                hijack_netrw_behavior = "open_current",
                -- "open_default",
                -- "disabled",
                filtered_items = {
                    -- when true, they will just be displayed differently than normal items
                    visible = true,
                    -- whether children of filtered parents should inherit their parent's highlight group
                    children_inherit_highlights = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_ignored = false, -- hide files that are ignored by other gitignore-like files
                    -- other gitignore-like files, in descending order of precedence.
                    ignore_files = {
                        ".neotreeignore",
                        ".ignore",
                        -- ".rgignore"
                    },
                    hide_hidden = true, -- only works on Windows for hidden files/directories
                    hide_by_name = {
                        ".DS_Store",
                        "thumbs.db",
                        --"node_modules",
                    },
                    hide_by_pattern = {
                        --"*.meta",
                        --"*/src/*/tsconfig.json",
                    },
                    always_show = { -- remains visible even if other settings would normally hide it
                        --".gitignored",
                    },
                    always_show_by_pattern = { -- uses glob style patterns
                        --".env*",
                    },
                    never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                        --".DS_Store",
                        --"thumbs.db",
                    },
                    never_show_by_pattern = { -- uses glob style patterns
                        --".null-ls_*",
                    },
                },
            }

        }

    }
}
