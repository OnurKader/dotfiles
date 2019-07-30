" Setting Stuff
filetype off
filetype plugin indent on
let mapleader =","
nnoremap <space> za
set autoread
set backup
set backupdir=~/.config/nvim/backup
set background=dark
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
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
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
autocmd BufRead,BufNewFile /home/beronthecolossus/.config/i3/* set filetype=i3
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
map <C-n> :NERDTreeToggle<CR>
" Compile Stuff
" Regular C/C++
" autocmd FileType c noremap <F5> <Esc>:w <CR> :!gcc -o %< % -O3 && ./%< <CR>
" autocmd FileType cpp noremap <F5> <Esc>:w <CR> :!g++ -o %< % -O3 && ./%< <CR>
" olcPixelGameEngine
autocmd FileType cpp noremap <F6> <Esc>:w <CR> :!g++ % -o %< -lX11 -O3 -lGL -lpthread -lpng && vblank_mode=0 ./%< <CR>
" SFML
autocmd FileType cpp noremap <F7> <Esc>:w <CR> :!g++ % -o %< -lsfml-graphics -O3 -lsfml-window -lsfml-system && ./%< <CR>
" OpenCV
autocmd FileType cpp noremap <F8> <Esc>:w <CR> :!g++ % -o %< -O3 `pkg-config --libs --cflags opencv` && ./%< <CR>
" R-MarkDown
" autocmd FileType rmd map <F5> :!pandoc<Space><C-r>%<Space>-o<Space><C-r>%.pdf<Enter><Enter>
map <F5> :w! \| !compiler <C-r>%<CR>
" CTRL-C to toggle highlight.
let hlstate=0
nnoremap <C-c> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1 <esc> <CR>
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
let g:ycm_auto_trigger = 0
let g:ycm_min_num_of_chars_for_completion = 0
let g:ycm_complete_in_strings = 0
let g:ycm_log_level = 'warning'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
" MarkdownPreview Stuff
let g:mkdp_browser = 'firefox'
let g:mkdp_refresh_slow = 1
let g:mkdp_markdown_css = '/home/beronthecolossus/Peki/github-markdown.css'
" FileType Specific Stuff
""" LATEX
	" Word count:
	autocmd FileType tex map <leader>w :w !detex \| wc -w<CR>
	" Code snippets
	autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
	autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
	autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
	autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
	autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
	autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
	autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i
	autocmd FileType tex inoremap ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
	autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
	autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,li <Enter>\item<Space>
	autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
	autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
	autocmd FileType tex inoremap ,can \cand{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,v \vio{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i
	autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
	autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
	autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,bt {\blindtext}
	autocmd FileType tex inoremap ,nu $\varnothing$
	autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
	autocmd FileType tex inoremap ,rn (\ref{})<++><Esc>F}i

""" HTML
	autocmd FileType html inoremap ,b <b></b><Space><++><Esc>FbT>i
	autocmd FileType html inoremap ,it <em></em><Space><++><Esc>FeT>i
	autocmd FileType html inoremap ,1 <h1></h1><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,2 <h2></h2><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,3 <h3></h3><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,p <p></p><Enter><Enter><++><Esc>02kf>a
	autocmd FileType html inoremap ,a <a<Space>href=""><++></a><Space><++><Esc>14hi
	autocmd FileType html inoremap ,e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
	autocmd FileType html inoremap ,ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
	autocmd FileType html inoremap ,li <Esc>o<li></li><Esc>F>a
	autocmd FileType html inoremap ,ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
	autocmd FileType html inoremap ,im <img src="" alt="<++>"><++><esc>Fcf"a
	autocmd FileType html inoremap ,td <td></td><++><Esc>Fdcit
	autocmd FileType html inoremap ,tr <tr></tr><Enter><++><Esc>kf<i
	autocmd FileType html inoremap ,th <th></th><++><Esc>Fhcit
	autocmd FileType html inoremap ,tab <table><Enter></table><Esc>O
	autocmd FileType html inoremap ,gr <font color="green"></font><Esc>F>a
	autocmd FileType html inoremap ,rd <font color="red"></font><Esc>F>a
	autocmd FileType html inoremap ,yl <font color="yellow"></font><Esc>F>a
	autocmd FileType html inoremap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
	autocmd FileType html inoremap ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
	autocmd FileType html inoremap &<space> &amp;<space>

"MARKDOWN
	autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
	autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
	autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
	autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
	autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
	autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
	autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
	autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO


