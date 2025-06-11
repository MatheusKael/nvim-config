-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- => Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'eandrju/cellular-automaton.nvim'
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } },
    }
    use({
        'ray-x/go.nvim',
        config = function()
            require("go").setup()
        end
    })
    use('prettier/vim-prettier')
    use({
        'folke/tokyonight.nvim',
        config = function()
            require('tokyonight').setup {
                on_colors = function(colors)
                    colors.comment = "#868eb6"
                end,
                on_highlights = function(hl, c)
                    hl.MiniTrailspace = { fg = c.orange }
                    hl.NormalFloat = { bg = "#373d58" }
                    hl.FloatBorder = { fg = hl.FloatBorder.fg, bg = "#373d58" }
                    hl.Function = { fg = "#8cafff", style = { bold = true } }
                    hl.FoldColumn = { fg = hl.FoldColumn.fg, bg = "#343953" }
                    hl.SignColumn = { fg = hl.SignColumn.fg, bg = "#343953" }
                    hl.WinSeparator = { fg = "#868eb6" }
                end
            }
        end
    })
    use({
        'jose-elias-alvarez/null-ls.nvim',
    })
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('nvim-treesitter/nvim-treesitter-context')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }

    }

    use('editorconfig/editorconfig-vim')
    use('ThePrimeagen/vim-be-good')
    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
            }
        end
    })
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    }
    use("github/copilot.vim")

    use({
        "epwalsh/obsidian.nvim",
        requires = {
            -- Required.
            "nvim-lua/plenary.nvim",
        },
    })
end)
