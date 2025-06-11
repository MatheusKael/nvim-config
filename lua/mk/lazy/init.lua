return {
    { 'neoclide/coc.nvim',        build = 'npm ci' },
    { 'yaegassy/coc-volar',       build = 'yarn install --frozen-lockfile' },
    { 'yaegassy/coc-volar-tools', build = 'yarn install --frozen-lockfile' },
    {
        "vhyrro/luarocks.nvim",
        priority = 1001, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
        config = true,
    },
    {
        "nvim-lua/plenary.nvim",
        name = "plenary",
    },
    "eandrju/cellular-automaton.nvim",
    "gpanders/editorconfig.nvim",
    "prettier/vim-prettier",
}
