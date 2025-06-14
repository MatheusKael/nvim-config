function ColorMyPencils(color)
    color = color or "tokyonight"

    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup {
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
            --vim.cmd("colorscheme tokyonight")
        end
    },
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("cyberdream").setup({
                theme = "dark",
                --transparent = true,
                italic = false,
                highlights = {
                    NonText = { fg = "#97866A", bg = "NONE", italic = true },
                },
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                    functions = { bold = true },
                    variables = { italic = false },
                    strings = { italic = false },
                }
            })
            vim.cmd("colorscheme cyberdream")
        end

    }
}
