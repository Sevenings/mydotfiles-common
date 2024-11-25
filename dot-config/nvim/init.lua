local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)


-- Lazy Vim Setup
require('config.lazy')




--- Plugins Config Import
---------------------

-- local plugins_path = vim.fn.stdpath("config") .. "/plugins/"
-- vim.cmd.source(plugins_path .. "lua-mappings.lua")

require("luasnip.loaders.from_vscode").lazy_load()




-- LSP-cmp keybindings

local ls = require('luasnip')
local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        -- ['<Esc>'] = cmp.mapping.abort(),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
        ['<c-k>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item({ behavior = 'insert' })
            else
                cmp.complete()
            end
        end),
        ['<c-j>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item({ behavior = 'insert' })
            else
                cmp.complete()
            end
        end),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<s-Tab>"] = cmp.mapping(function(fallback)
            if ls.jumpable(-1) then
                ls.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),

    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        format = require("nvim-highlight-colors").format
    },
})


