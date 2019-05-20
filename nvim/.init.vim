" Setting Stuff
filetype off
filetype plugin indent on
let mapleader =","
nnoremap <space> za
set autoread
set backup
set backupdir=~/.config/nvim/backup
set complete-=i
set directory=~/.config/nvim/tmp
set encoding=utf-8
set foldmethod=manual
set ignorecase
set incsearch
set lazyredraw
set mouse=a
set nocompatible
set noerrorbells
set noexpandtab
set nrformats+=alpha
set number relativenumber
set path+=**
set ruler
set scrolloff=2
set shell=zsh
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set smartindent
set softtabstop=4
set splitbelow
set splitright
set t_Co=256
set tabstop=4
set visualbell
set wildmenu
set wildmode=list:longest,full
set wrap
syntax on
call plug#begin('~/.local/share/nvim/plugged')
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'christoomey/vim-sort-motion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'elzr/vim-json'
Plug 'gko/vim-coloresque'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'mileszs/ack.vim'
Plug 'neomake/neomake'
Plug 'plytophogy/vim-virtualenv'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'sjl/badwolf'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'sophacles/vim-processing'
Plug 'ryanoasis/vim-devicons'
call plug#end()
" Color Scheme
" Make the gutters darker than the background.
let g:badwolf_darkgutter = 1
" Make the tab line lighter than the background.
let g:badwolf_tabline = 2
colorscheme badwolf
" Airline Stuff
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" Powerline Symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
" Views
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Clipboard & Statusline
set clipboard=unnamedplus
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
au BufNewFile,BufRead *.py set textwidth=80
nmap <silent> <buffer> gK <Plug>(kite-docs)
autocmd FileType python set colorcolumn=80

" Enable deoplete when InsertEnter.
let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable()
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Some Movement Stuff
nnoremap j gj
nnoremap k gk
" Moving to Windows (Split)
xnoremap <C-h> <C-w>h
xnoremap <C-j> <C-w>j
xnoremap <C-k> <C-w>k
xnoremap <C-l> <C-w>l
inoremap jk <esc>
" Remove Arrow Key Functionality in Normal Mode
nnoremap <Left> <nop>
nnoremap <Right> <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" CTRL-P
nnoremap <leader>a :Ag
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_switch_buffer = 'et'
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

call neomake#configure#automake('rw', 1000)
let g:kite_tab_complete=1
" set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2  " always display the status line

map <C-o> :NERDTreeToggle<CR>
nnoremap <F5> :w <CR> :!g++ -o %< % && ./%< <CR>
map <leader>o :setlocal spell! spelllang=en_us<CR>

" CTRL-C to toggle highlight.
let hlstate=0
nnoremap <C-c> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1 <esc> <CR>

autocmd BufRead,BufNewFile /home/beronthecolossus/.config/i3/* set filetype=i3
" Remove Whitespace
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" Leader bindings for some snippets and Write/Quit
inoremap <leader>for <esc>Ifor (int i = 0; i < <esc>A; i++) {<enter>}<esc>O<tab>
inoremap <leader>if <esc>Iif (<esc>A) {<enter>}<esc>O<tab>
inoremap <leader>sys <esc>ISystem.out.println(<esc>A);
vnoremap <leader>sys yOSystem.out.println(<esc>pA);
inoremap <leader>cout <esc>Istd::cout << <esc>A << std::endl;
vnoremap <leader>cout yOstd::cout << <esc>pA << std:endl;
inoremap <leader>sfml <Esc>:w<CR><Esc>:!g++ % -o %< -lsfml-graphics -lsfml-window -lsfml-system && ./%< <CR>
inoremap <leader>w <Esc>:w<CR>
nnoremap <leader>w :w<CR>
inoremap <leader>q <ESC>:q<CR>
nnoremap <leader>q :q<CR>
inoremap <leader>x <ESC>:x<CR>
nnoremap <leader>x :x<CR>
nnoremap <Return> o<Esc>
nnoremap <Enter> o<Esc>
