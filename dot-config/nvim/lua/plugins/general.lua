return {
    {'elkowar/yuck.vim'},
    {'tpope/vim-fugitive'},
    {'tikhomirov/vim-glsl'},
    {'ryanoasis/vim-devicons'},
    {'DreamMaoMao/yazi.nvim'},
    -- {
    --   "karb94/neoscroll.nvim",
    --   config = function ()
    --     require('neoscroll').setup({})
    --   end
    -- },
    -- {'kevinhwang91/nvim-ufo'},
    { 'airblade/vim-rooter' },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function ()
        require('todo-comments').setup({})
      end
    }
}
