" Configuration file for vim
if !empty($MY_RUBY_HOME)
   let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/rubysite_ruby/*'),"\n"),',')
 endif
set ttyfast
set modelines=0		" CVE-2007-2438
set tabstop=2 
set shiftwidth=2 
set expandtab
set foldlevelstart=99
set hlsearch
hi link htmlLink NONE
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'tmhedberg/matchit'
Plugin 'scrooloose/nerdtree'
Plugin 'powerline/fonts'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tpope/vim-fugitive'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'Lokaltog/vim-powerline'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-sensible'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'vim-tags'
"Plugin 'w0rp/ale'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'chemzqm/vim-jsx-improve'
"Plugin 'vim-syntastic/syntastic'
" Plugin 'jelera/vim-javascript-syntax'
" Plugin 'slim-template/vim-slim'
" Plugin 'mattn/emmet-vim'
" Plugin 'plasticboy/vim-markdown'
" Plugin 'thinca/vim-quickrun'
" Plugin 'kchmck/vim-coffee-script'
" Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'terryma/vim-multiple-cursors'
" Plugin 'hail2u/vim-css3-syntax'
Plugin 'majutsushi/tagbar'
" Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line

call vundle#end()            " required
syntax enable
filetype plugin indent on    " required


au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup
set number
imap jj <esc>
" set ctags 
 let Tlist_Ctags_Cmd='/usr/bin/ctags' 
let mapleader = ","
"let g:syntastic_javascript_checkers=['eslint']

 map <silent> <leader>ee :!sudo vim ~/.vimrc<cr>
 autocmd! bufwritepost vimrc  source /usr/share/vim/vimrc
" Copy to clipboard
vmap <C-c> :w !pbcopy<CR><CR>

nmap <leader>t :TagbarToggle<CR>

nmap <F7> :NERDTreeToggle<CR>

nmap <A-R>  :!ruby % <CR>
" map ctrl+s to save current file
inoremap <silent> <C-S>         <C-C>:update<CR>
noremap <silent> <C-S>          :update<CR>
noremap <silent> nh             :noh<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>

" I also map <leader>s to save a file.
" inoremap <leader>s <C-C>:update<CR>
" noremap <leader>s :update<CR>
" vnoremap <leader>s <C-C>:update<CR>
" Map , ss to be save all
 map   <leader>ss :wa<cr>


" inoremap <silent> <C-S>         <C-O> :update <Esc><CR>
" shortcut for saving file which is beyong your authority
map <silent> <leader>f :w !sudo tee %<cr>
" make snippet work instancely
" set quit
" map <leader> :q<cr>
" map <leader>b :!sudo vim ~/.vim/bundle<cr>
" Auto flush then CtrlP
nnoremap <silent> <leader>c :ClearCtrlPCache<cr>\|:CtrlP<cr>
" noremap <space>1 1gt
" noremap <space>0 :tablast<cr>
" nnoremap <silent> <space>l :exe "tabn ".g:lasttab<cr>
" vnoremap <silent> <space>l :exe "tabn ".g:lasttab<cr>
au TabLeave * let g:lasttab = tabpagenr()
" noremap <tab> gT
" set backspace=indent,eol,start

" switch split window easily.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Set colorscheme
set t_Co=256
set background=dark
" Set the popup menu
highlight Pmenu ctermfg=black ctermbg=blue

" Visual color on
hi Visual term=reverse cterm=reverse guibg=Grey

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/android/*,*/ios/*
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)|tags$'

" Nerdtree Ignore
let NERDTreeIgnore = ['^node_modules$']

" Eslint
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exe = 'npm run lint --'
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

let g:jsx_ext_required = 1
