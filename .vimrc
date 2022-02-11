call plug#begin('~/.vim/plugged')

"Utils
Plug 'wellle/context.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'voldikss/vim-floaterm'
Plug 'mhinz/vim-startify'
Plug 'machakann/vim-highlightedyank'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'jiangmiao/auto-pairs'
Plug 'rafamadriz/friendly-snippets'
Plug 'preservim/nerdcommenter'
Plug 'liuchengxu/vista.vim'

"Color 
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'

"Formate
Plug 'sbdchd/neoformat'

"Snip
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

"Syntax
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'itchyny/lightline.vim'
Plug 'cespare/vim-toml'

"Lsp and completinon
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'

call plug#end()

set nocompatible
set nu
set completeopt=menuone,noinsert,noselect,preview
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to,
let mapleader=' '

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number
"set relativenumber
set cursorline
set noerrorbells visualbell t_vb=
set showtabline=2

"let g:gruvbox_material_background = 'hard'
"colorscheme gruvbox-material
colorscheme palenight

" Better command line completion
set wildmenu

" mouse support
set mouse=a
set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

"coppy past
set clipboard=unnamed,unnamedplus

"Formate
set smartindent
"autocmd BufRead,BufWritePre *.vimrc normal gg=G
"set autoindent

"" Disable the blinking cursor.
set gcr=a:blinkon0

set scrolloff=10

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10
set termguicolors
set title
set titleold="Terminal"
set titlestring=%F
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set noshowmode

"Nerd commenter 
let g:NERDCreateDefaultMappings = 1

"Vista Settings

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

"Lightline
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'component_function': {
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ }
let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }

let g:lightline#bufferline#enable_nerdfont=1
let g:lightline#bufferline#enable_devicons=1
let g:lightline#bufferline#unicode_symbols=1
function! LightlineFilename()
    return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

"Which kye
nnoremap <silent> <leader> :WhichKey ' '<CR>

"asyncomplete
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'allowlist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

"Bracktes
let g:rainbow_active = 1
"let g:AutoPairsFlyMode = 1

"Float term
nnoremap <silent> <Leader>fn  :FloatermNew<CR>
tnoremap <silent> <Leader>fn  <C-\><C-n>:FloatermNew<CR>
nnoremap <silent> <Leader>fp  :FloatermPrev<CR>
tnoremap <silent> <Leader>fp  <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> <Leader>ff  :FloatermNext<CR>
tnoremap <silent> <Leader>ff  <C-\><C-n>:FloatermNext<CR>
nnoremap <silent> <Leader>ft :FloatermToggle<CR>
tnoremap <silent> <Leader>ft <C-\><C-n>:FloatermToggle<CR>

"Mappings
nnoremap <Leader>tf :Vista<CR>
nnoremap <Leader>tc :Vista!!<CR>
nnoremap <S-l> :bn<CR>
"nnoremap <S-h> :bp<CR>
nnoremap <Leader>l :NERDTreeToggle<CR>
nnoremap <Leader>h :NERDTreeFocus<CR>
inoremap jj <ESC>
