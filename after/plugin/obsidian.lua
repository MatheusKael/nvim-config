
require("obsidian").setup({
    dir = "~/.dotfiles/personal/myvault/",

    notes_subdir = "notes",

    daily_notes = {
        folder = "notes/dailies",
        date_format = "%d-%m-%Y"
    },   

    completion = {
        -- If using nvim-cmp, otherwise set to false
        nvim_cmp = true,
        -- Trigger completion at 2 chars
        min_chars = 2,
        -- Where to put new notes created from completion. Valid options are
        --  * "current_dir" - put new notes in same directory as the current buffer.
        --  * "notes_subdir" - put new notes in the default notes subdirectory.
        new_notes_location = "current_dir",

        -- Whether to add the output of the node_id_func to new notes in autocompletion.
        -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
        prepend_note_id = true
    },
    finder = "telescope.nvim",
})
