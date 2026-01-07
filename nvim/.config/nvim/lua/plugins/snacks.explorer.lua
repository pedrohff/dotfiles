return {
    {
        "folke/snacks.nvim",
        opts = {
            -- explorer = {
            -- },
            picker = {
                sources = {
                    explorer = {
                        auto_close = true,
                        hidden=true,
                        layout = {
                            fullscreen = true
                        }
                    }
                }
            }
        },
        keys = {
            { "<leader>gs", false }
        }
    }
}
