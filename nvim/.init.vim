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
set inccommand=nosplit
set incsearch
set lazyredraw
set mouse=a
set nocompatible
set noerrorbells
set noexpandtab
set novisualbell
set nrformats+=alpha
set number relativenumber
set path+=**
set ruler
set scrolloff=4
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
set termguicolors
set wildmenu
set wildmode=list:longest,full
set wrap
syntax on
" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'Shougo/denite.nvim'
Plug 'Valloric/YouCompleteMe'
Plug 'christoomey/vim-sort-motion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'elzr/vim-json'
Plug 'gko/vim-coloresque'
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}
Plug 'junegunn/goyo.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'mileszs/ack.vim'
Plug 'neomake/neomake'
Plug 'plasticboy/vim-markdown'
Plug 'plytophogy/vim-virtualenv'
Plug 'rking/ag.vim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'sjl/badwolf'
Plug 'sophacles/vim-processing'
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
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
autocmd FileType python set colorcolumn=80
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Some Movement Stuff
nnoremap j gj
nnoremap k gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
" Moving to Windows (Split)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap jk <esc>
inoremap jj <Esc>
" gj gk Arrow Key Functionality in Normal Mode
nnoremap <Up> gk
nnoremap <Down> gj
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" Mappings
nnoremap Q @@
nnoremap s "_s
nnoremap x "_x
" Pear Tree
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
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
map <C-l> :NERDTreeToggle<CR>
" Compile Stuff
" Regular C/C++
nnoremap <F5> :w <CR> :!g++ -o %< % -O3 && ./%< <CR>
" olcPixelGameEngine
nnoremap <F6> :w <CR> :!g++ % -o %< -lX11 -O3 -lGL -lpthread -lpng && vblank_mode=0 ./%< <CR>
" SFML
nnoremap <F7> :w <CR> :!g++ % -o %< -lsfml-graphics -O3 -lsfml-window -lsfml-system && ./%< <CR>
" OpenCV
nnoremap <F8> :w <CR> :!g++ % -o %< -O3 `pkg-config --libs --cflags opencv` && ./%< <CR>
" CTRL-C to toggle highlight.
let hlstate=0
nnoremap <C-c> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1 <esc> <CR>
autocmd BufRead,BufNewFile /home/beronthecolossus/.config/i3/* set filetype=i3
" Remove Whitespace
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" Leader bindings for some snippets and Write/Quit
:noremap <leader>c :wincmd w<cr>
:noremap <leader>h :split<cr>
:noremap <leader>v :vsp<cr>
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
inoremap <leader>cout <Esc>Istd::cout << <Esc>A << std::endl;
inoremap <leader>for <Esc>Ifor (int i = 0; i < <Esc>A; i++) {<Enter>}<esc>O<tab>
inoremap <leader>if <esc>Iif (<esc>A) {<enter>}<esc>O<tab>
inoremap <leader>opge <Esc>:w<CR><Esc>:!g++ % -o %< -lX11 -lGL -lpthread -O3 -lpng `pkg-config --cflags --libs opencv` && vblank_mode=0 ./%< <CR>
inoremap <leader>pge <Esc>:w<CR><Esc>:!g++ % -o %< -lX11 -lGL -lpng -lpthread -O3 && vblank_mode=0 ./%< <CR>
inoremap <leader>q <ESC>:q<CR>
inoremap <leader>sfml <Esc>:w<CR><Esc>:!g++ % -o %< -lsfml-graphics -lsfml-window -O3 -lsfml-system && ./%< <CR>
inoremap <leader>sys <esc>ISystem.out.println(<esc>A);
inoremap <leader>w <Esc>:w<CR>
inoremap <leader>x <ESC>:x<CR>
inoremap <leader>pragma <Esc>ggI#ifndef<Space><++><CR>#define<Space><++><CR><Esc>GA<CR>#endif<CR><Esc>
map <leader><leader> <Esc>/<++><Enter>"_c4l
nnoremap <Enter> o<Esc>
nnoremap <S-Enter> O<Esc>
nnoremap <leader>j :m+<cr>==
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>w :w<CR>
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader>cout yOstd::cout << <esc>pA << std:endl;
vnoremap <leader>sys yOSystem.out.println(<esc>pA);
" YouCompleteMe Stuff
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 0
let g:ycm_complete_in_strings = 0
let g:ycm_log_level = 'warning'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']

