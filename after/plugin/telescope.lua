local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-f>', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function() 
	builtin.grep_string({search = vim.fn.input("Grep > ")})
end)

local layout = require "telescope.actions.layout"

require('telescope').setup {
    defaults = {
        layout_config = {
            height = 100,
            width = 0.99999,
        },
        preview = { hide_on_startup = true },
        prompt_prefix = " ",
        selection_caret = " ",
        -- path_display = { "smart" },
        file_ignore_patterns = { ".git/", "node_modules", "target" },

        mappings = {
            i = {
                ["<C-y>"] = layout.toggle_preview,
            },
        } 
    } 
} 
