local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files in project' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find files in git' })
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

return {
    {
        'nvim-telescope/telescope.nvim', tag = 'v0.2.1',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- optional but recommended
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        }
    }
}
