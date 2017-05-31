set nocompatible

let mapleader=","

call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-vinegar'
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_special_syntax = 1

" Plug 'nathanaelkane/vim-indent-guides'
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1
" let g:indent_guides_enable_on_vim_startup = 1

Plug 'tpope/vim-unimpaired'

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
let g:prosession_dir = '~/.config/nvim/session/'
let g:prosession_on_startup = 1

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_skip_empty_sections = 1

Plug 'slashmili/alchemist.vim',{ 'for': 'elixir' }

Plug '2072/PHP-Indenting-for-VIm', { 'for': 'php' }

" Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
let base16colorspace=256

Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

Plug 'w0rp/ale'
let g:ale_lint_on_text_changed = 'never'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']

Plug 'zchee/deoplete-jedi', { 'for': 'python'}

Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-commentary'

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_use_caching = 500
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = $HOME.'/.config/nvim/cache'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

call plug#end()

" Colors
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Don't list completetion menu messages
set shortmess+=c

" Show trailing whitespace
set listchars=trail:.
set list

set lazyredraw
set ffs=unix,dos,mac

" Show last command
set showcmd

" Tabs and indeneting
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
filetype indent on

" Error sounds
set noerrorbells
set novisualbell
set tm=500

" Line numbers
set number

" Highlight matching brackets
set showmatch

" How wildmenu displays results
set wildmode =list:longest,full

" Case sensitivity
set smartcase
set ignorecase

" Searching
set hlsearch
nnoremap <CR> :nohlsearch<cr>

" Code folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
nnoremap <space> za

" Word wrap
set nowrap

" Enable mouse
set mouse=a
set mousehide

" Windows minimum width and height
set wmw=0
set wmh=0

" How to open splits
set splitright
set splitbelow

set completeopt=longest,menuone
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Backup/swap/undo/viminfo settings
set backup
set backupdir=$HOME/.config/nvim/files/backup/
set backupext=-vimbackup
set backupskip=
set directory=$HOME/.config/nvim/files/swap//
set updatecount=100
set undofile
set undodir=$HOME/.config/nvim/files/undo/
set viminfo='100,n$HOME/.config/nvim/files/info/viminfo'

" Dont unselect text after indenting
vnoremap < <gv
vnoremap > >gv

" Highlight last inserted text
nnoremap gV `[v`]

" Change to buffers current working directory
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" Navigate opening and closing tags/brackets with <Tab>
nnoremap <tab> %
vnoremap <tab> %

" Fast saving and quitting
nmap <leader>w :w!<CR>
nmap <leader>q :q!<CR>

" Write as sudo
cmap w!! w !sudo tee % >/dev/null

" Can use : or ;
nnoremap ; :

" Disable ex mode
nnoremap Q <nop>

" Map escape to also use jk
inoremap jk <esc>

" Make yank work more like d
nnoremap y y$

" Buffer navigation
nnoremap <PageDown> :bprevious<CR>
nnoremap <PageUp> :bnext<CR>
map <leader>bd :bdelete<CR>

" Edit and reload vim config
nmap <silent> <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nmap <silent> <leader>rv :source ~/.config/nvim/init.vim<cr>

" Open i3 config
nmap <silent> <leader>ew :vsplit ~/.config/i3/config <cr>

" Window navigaton
map <C-j> <C-W>j<C-W>_
map <C-k> <C-W>k<C-W>_
map <C-l> <C-W>l<C-W>_
map <C-h> <C-W>h<C-W>_

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Tab autocomplete
set secure
