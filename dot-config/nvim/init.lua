

local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)


-- NVIM LSP ZERO CONFIGURATIONS

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
end)


local nvimtree_config = vim.fn.stdpath("config") .. "/plugins/nvim-tree.lua"
vim.cmd.source(nvimtree_config)


-- here you can setup the language servers
-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { -- My language servers list
        'clangd',
        'lua_ls',
        'arduino_language_server',
        'pyright',
        'tsserver',
        'eslint',
        'cssls',
        'html',
    },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})


-- Configuração do lspconfig
local lspconfig = require("lspconfig")

-- Configura o servidor LSP HTML
lspconfig.html.setup({
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
})


-- Configure o servidor tsserver
lsp_zero.configure('tsserver', {
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
    },
  }
})

lsp_zero.setup()








require('nvim-treesitter.configs').setup {
  -- List of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {
    "javascript",
    "typescript",
    "html",
    "css",
    "json",
    "bash",
    "lua",
    "vim",
    "python",
    "c",
    "cpp",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}










--- Plugins Config Import
---------------------

local plugins_path = vim.fn.stdpath("config") .. "/plugins/"

vim.cmd.source(plugins_path .. "luasnip-snippets.lua")
vim.cmd.source(plugins_path .. "lua-mappings.lua")
vim.cmd.source(plugins_path .. "gitsigns.lua")

require("luasnip.loaders.from_vscode").lazy_load()







-- LSP-cmp keybindings

local cmp = require('cmp')
local ls = require('luasnip')

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
})


