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

" Para algum plugin aí, acho que o vimtex
set nosplitright


" =========
" FUNCTIONS
" =========

function TextModeOn()
    setlocal spell spelllang=pt_br
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

" Limpar conteudo do search, para retirar o highlight
map <Leader>/ :noh<CR>

noremap n nzz
noremap N Nzz



" Vimtex plugin configuration test
"
"
" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note: Most plugin managers will do this automatically!
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
" Note: Most plugin managers will do this automatically!
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'


" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
"let g:vimtex_compiler_method = 'latexrun'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
