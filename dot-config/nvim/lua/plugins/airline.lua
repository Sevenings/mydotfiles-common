return {
    {
        'vim-airline/vim-airline',
        config = function()
          -- load the colorscheme here
          vim.cmd([[let g:airline_theme='transparent']])
        end,
    },
    {'vim-airline/vim-airline-themes'}
}

