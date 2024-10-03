" ====================
" Configurações Gerais 
" ====================
set expandtab
set tabstop=4
set softtabstop=4 
set shiftwidth=4
set autoindent

set nocompatible
filetype off
filetype plugin indent on

set termguicolors
set cursorline
set background=dark
set encoding=UTF-8

set number relativenumber
set cursorline
set hlsearch

set nowrap
set scrolloff=8
set sidescrolloff=8

set foldmethod=indent
set foldlevel=99



" =========
" FUNCTIONS
" =========

function TextModeOn()
    setlocal spell spelllang=pt_BR
    set textwidth=67
endfunction

function TextModeOff()
    setlocal nospell 
    set textwidth=0
endfunction


function OpenTerminal()
    vsp
    term
endfunction

" ========
" COMMANDS
" ========

command Texton call TextModeOn()
command Textoff call TextModeOff()

command GenCMakeCompileCommands !cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1<CR>



" ========
" MAPPINGS
" ========

let mapleader = "\<space>"

" Melhor CTRL+C e CTRL+V para fora do vim
noremap <leader>y "+y
noremap <leader>p "+p

" Salvar
map <C-s> :w<CR>

" Makefile setup mappings
map <F6> :w<CR>:!clear<CR>:!make compile<CR>
map <F5> :!make run<CR>

" Executar arquivo com python
map <leader><F5>p :!rifle -w python %<CR>


" Abrir Terminal ah lá VSCode
map <Leader>tt :sp<CR><c-w>w:term<CR>:resize 8<CR>
map <Leader>T :tabnew<CR>:term<CR>

" Terminal ESC goes to normal mode
tnoremap <Esc> <C-\><C-n>

" Switches do modo Escrita
map <Leader>ton :Texton<CR>
map <Leader>tof :Textoff<CR>

" Atalhos de arquivos
map <F12> :vsp ~/.config/nvim/vimrc.vim<CR>
map <F1> :vsp makefile<CR>

" Control-Backspace 
map <C-BS> vbd
imap <C-BS> <ESC>vbda

" Insert Mode Movements
imap <c-h> <ESC>i
imap <c-j> <ESC>ja
imap <c-k> <ESC>lki
imap <c-l> <ESC>la

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Yazi
map <Leader>gy :Yazi<CR>

" Remap commentary
map <Leader>c gcc
vmap <Leader>c gc

" End comma
imap ;; <ESC>A;<ESC>

" Normal mode on jj
imap jj <ESC>

"map <c-a> GVgg_
map <c-c> "+y
map <c-v> "+p


" =======================================================
"               Plugins with VimPlug
" =======================================================
call plug#begin()
source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/airline-themes.vim
source ~/.config/nvim/plugins/nvim-tree.vim
source ~/.config/nvim/plugins/vim-glsl.vim
source ~/.config/nvim/plugins/vim-fugitive.vim
source ~/.config/nvim/plugins/yuck.vim

"source ~/.config/nvim/plugins/coc.vim
"source ~/.config/nvim/plugins/vim-lsp-cxx-highlight.vim
"source ~/.config/nvim/plugins/vim-arduino-syntax.vim
"source ~/.config/nvim/plugins/vimtex.vim
source ~/.config/nvim/plugins/vim-lsp.vim

"source ~/.config/nvim/plugins/ultisnips.vim
"source ~/.config/nvim/plugins/vim-snippets.vim

source ~/.config/nvim/plugins/kotlin-vim.vim

" APPEARENCE
" ---------------------
"
" COLORSCHEMES
"source ~/.config/nvim/plugins/gruvbox.vim
"Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
"Plug 'folke/tokyonight.nvim'
Plug 'yonlu/omni.vim'
Plug 'rebelot/kanagawa.nvim'
"
" MISCELANEOUS
"source ~/.config/nvim/plugins/vim-transparent.vim


source ~/.config/nvim/plugins/yazi-nvim.vim

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'ryanoasis/vim-devicons'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'jiangmiao/auto-pairs'

Plug 'barrett-ruth/live-server.nvim', 

Plug 'rafamadriz/friendly-snippets'

Plug 'hrsh7th/cmp-path'

Plug 'nvim-treesitter/nvim-treesitter'

Plug 'lewis6991/gitsigns.nvim'
"Plug 'garymjr/nvim-snippets'


"source ~/.config/nvim/plugins/jupyter-vim.vim
call plug#end()

" ===========================
" Colorscheme Configs
" ===========================


colorscheme kanagawa
let g:airline_theme='transparent'

lua vim.keymap.set('v', '<Leader>s',  ":SSSelected" )

"Live server for web development
lua require('live-server').setup()

set nosplitright
