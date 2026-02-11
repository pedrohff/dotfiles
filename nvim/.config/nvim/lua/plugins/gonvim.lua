return {
    {
        "fatih/vim-go",
        build = ":GoInstallBinaries",
    },
    -- {
    --     "ray-x/go.nvim",
    --     dependencies = {  -- optional packages
    --         "ray-x/guihua.lua",
    --         "neovim/nvim-lspconfig",
    --         "nvim-treesitter/nvim-treesitter",
    --     },
    --     opts = function()

    --         require("go").setup(opts)
    --         -- local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
    --         -- vim.api.nvim_create_autocmd("BufWritePre", {
    --         --     pattern = "*.go",
    --         --     callback = function()
    --         --         require('go.format').goimports()
    --         --     end,
    --         --     group = format_sync_grp,
    --         -- })
    --         return {
    --             -- lsp_keymaps = true,
    --             -- other options
    --             run_in_floaterm = true,
    --             --test_runner = 'gotestsum',
    --             lsp_cfg = true,
    --             lsp_on_attach = true,
    --         }
    --     end,
    --     event = {"CmdlineEnter"},
    --     ft = {"go", 'gomod'},
    --     build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    -- }
}
