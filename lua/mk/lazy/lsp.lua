return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                "gopls",
                "volar",
                "eslint-lsp"
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                    }
                end,
               ["ts_ls"] = function()
                   require("lspconfig").ts_ls.setup {
                       filetypes = { "javascript", "typescript", "vue" },
                       init_options = {
                           plugins = {
                               {
                                   name = "@vue/typescript-plugin",
                                   location = "/home/matheus/.config/nvm/versions/node/v16.20.2/lib/node_modules/@vue/typescript-plugin/",
                                   languages = { "javascript", "typescript", "vue" },
                               },
                           },
                       },
                   }
               end,
                ["volar"] = function()
                    require("lspconfig").volar.setup {
                        on_attach = function(e)
                            local opts = { buffer = e.buf }
                            print("Volar attached")
                            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
                            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                        end,
                        init_options = {
                            typescript = {
                                tsdk = '/home/matheus/.config/nvm/versions/node/v16.20.2/lib/node_modules/typescript/lib'
                            }
                        },
                        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
                        capabilities = capabilities,
                        settings = {
                            volar = {
                                codeLens = {
                                    references = true,
                                    pugTools = true,
                                    scriptSetupTools = true,
                                },
                            },
                            vetur = {
                                completion = {
                                    autoImport = true,
                                    tagCasing = "kebab",
                                    useScaffoldSnippets = false,
                                },
                                format = {
                                    defaultFormatter = {
                                        js = "prettier",
                                        ts = "prettier",
                                    },
                                },
                                validation = {
                                    templateProps = true,
                                    interpolation = true,
                                },
                                useWorkspaceDependencies = true,
                                validationTemplateProps = true,
                                validationInterpolation = true,
                            },
                        },
                    }
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" }, -- For luasnip users.
            }, {
                { name = "buffer" },
            })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
