return {
    -- Adittional Snippets
    {'rafamadriz/friendly-snippets'},

    -- Cmp compatibility
    {'saadparwaiz1/cmp_luasnip'},

    -- Snippets Engine
    {
        'L3MON4D3/LuaSnip',
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        config = function()
            vim.cmd[[
            " Use Tab to expand and jump through snippets
            imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
            smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

            " Use Shift-Tab to jump backwards through snippets
            imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
            smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
            ]]

        end,
        init = function ()

            -- Configuration
            require("luasnip").config.set_config({ -- Setting LuaSnip config

              -- Enable autotriggered snippets
              enable_autosnippets = true,

              -- Use Tab (or some other key if you prefer) to trigger visual selection
              store_selection_keys = "<Tab>",

              update_events = 'TextChanged,TextChangedI'
            })

            -- Load snippets from ~/.config/nvim/Snippets/
            require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/snippets/"})

        end
    },
}
