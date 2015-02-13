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
Plugin 'slim-template/vim-slim'
Plugin 'mattn/emmet-vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'godlygeek/tabular'
Plugin 'Yggdroot/indentLine'


" Plugin 'godlygeek/tabular'
" Plugin 'nathanaelkane/vim-indent-guides'
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

 map <silent> <leader>ee :!sudo vim ~/.vimrc<cr>
 autocmd! bufwritepost vimrc  source /usr/share/vim/vimrc

map <F7> :NERDTreeToggle<CR>
nmap <A-R>  :!ruby % <CR>
" map ctrl+s to save current file
inoremap <silent> <C-S>         <C-C>:update<CR>
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>

" I also map <leader>s to save a file.
inoremap <leader>s <C-C>:update<CR>
noremap <leader>s :update<CR>
vnoremap <leader>s <C-C>:update<CR>
" Map , ss to be save all
 map   <leader>ss :wa<cr>

" inoremap <silent> <C-S>         <C-O> :update <Esc><CR>
" shortcut for saving file which is beyong your authority
map <silent> <leader>f :w !sudo tee %<cr>
" make snippet work instancely
" set quit
map <leader> :q<cr>
map <leader>b :!sudo vim ~/.vim/bundle<cr>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" Auto flush then CtrlP
nnoremap <silent> <leader>t :ClearCtrlPCache<cr>\|:CtrlP<cr>
noremap <space>1 1gt
noremap <space>2 2gt
noremap <space>3 3gt
noremap <space>4 4gt
noremap <space>5 5gt
noremap <space>6 6gt
noremap <space>7 7gt
noremap <space>8 8gt
noremap <space>9 9gt
noremap <space>0 :tablast<cr>
nnoremap <silent> <space>l :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <space>l :exe "tabn ".g:lasttab<cr>
au TabLeave * let g:lasttab = tabpagenr()
noremap <tab> gT
set backspace=indent,eol,start

" Set colorscheme
colorscheme murphy
" Set the popup menu
highlight Pmenu ctermfg=black ctermbg=blue

" Set vim indention

function! ToggleIndentGuidesTabs()
  if exists('b:iguides_tabs')
    setlocal nolist
    let &l:listchars = b:iguides_tabs
    unlet b:iguides_tabs
  else
    let b:iguides_tabs = &l:listchars
    setlocal listchars=tab:┆\ "protect the space
    setlocal list
  endif
endfunction

function! ToggleIndentGuidesSpaces()
  if exists('b:iguides_spaces')
    call matchdelete(b:iguides_spaces)
    unlet b:iguides_spaces
  else
    let pos = range(1, &l:textwidth, &l:shiftwidth)
    call map(pos, '"\\%" . v:val . "v"')
    let pat = '\%(\_^\s*\)\@<=\%(' . join(pos, '\|') . '\)\s'
    let b:iguides_spaces = matchadd('CursorLine', pat)
  endif
endfunction

" call ToggleIndentGuidesTabs()
" call ToggleIndentGuidesSpaces()
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)|tags$'
