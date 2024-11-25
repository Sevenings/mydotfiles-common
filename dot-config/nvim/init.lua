local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)


-- Lazy Vim Setup
require('config.lazy')


--- Plugins Config Import
---------------------

require('extras.screenshots')
require('extras.nvim-cmp-configs')

require("luasnip.loaders.from_vscode").lazy_load()

