
-- Lazy Vim Setup
require('config.lazy')

require('neodev').setup({})

-- Import vimrc
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)


--- Plugins Config Import
---------------------

require('extras.screenshots')
require('extras.nvim-cmp-configs')

require("luasnip.loaders.from_vscode").lazy_load()


require("lspconfig").arduino_language_server.setup {
    settings = {
        arduino = {
            -- Caso o servidor necessite do caminho para o arduino-cli, ajuste conforme necessário.
            path = "/usr/bin/arduino-cli",
        },
    },
}
