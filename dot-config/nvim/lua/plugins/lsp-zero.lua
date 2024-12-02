return {

    -- Mason, LSP Manager
    {
        'williamboman/mason.nvim',
        init = function()
            require('mason').setup({})
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = { -- My language servers list
                    'clangd',
                    'lua_ls',
                    'arduino_language_server',
                    'pyright',
                    'eslint',
                    'ts_ls',
                    'cssls',
                    'html',
                },
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                },
            })
        end,
    },


    -- Lsp do Neovim
    {'neovim/nvim-lspconfig'},

    -- Lsp-zero, LSP pré-configurado
    {
        'VonHeikemen/lsp-zero.nvim',
        init = function()
            local lsp_zero = require('lsp-zero')

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            local lsp_zero = require('lsp-zero')

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            -- Configure o servidor tsserver
            lsp_zero.configure('ts_ls', {
              on_attach = function(client, bufnr)
                local ts_utils = require('nvim-lsp-ts-utils')
                ts_utils.setup({})
                ts_utils.setup_client(client)
              end
            })


            -- Configure o servidor eslint
            lsp_zero.configure('eslint', {
              settings = {
                format = { enable = true }
              },
              on_attach = function(client, bufnr)
                client.resolved_capabilities.document_formatting = true
              end
            })

            -- Configure o servidor cssls
            lsp_zero.configure('cssls', {
              settings = {
                css = {
                  validate = true,
                },
                less = {
                  validate = true,
                },
                scss = {
                  validate = true,
                }
              }
            })

            lsp_zero.setup()
        end
    },


    -- Nvim-cmp. Autosugestion e completion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
}
