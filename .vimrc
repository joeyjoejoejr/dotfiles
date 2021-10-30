if &compatible
  set nocompatible
endif

call plug#begin('~/.vim/plugged')

if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" VIM Enhancements
Plug 'editorconfig/editorconfig-vim'

" GUI Enhancements
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'machakann/vim-highlightedyank'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Completions
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntacitic language support
Plug 'cespare/vim-toml'
Plug 'elixir-lang/vim-elixir'
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'
Plug 'jparise/vim-graphql'


" Expansion
Plug 'mattn/emmet-vim'

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'iCyMind/NeoSolarized'
Plug 'ayu-theme/ayu-vim'

Plug 'vimwiki/vimwiki'

call plug#end()

" Required:
filetype plugin indent on
syntax on
syntax enable

" ---------------------------------------------------------------------------
" BASIC SETTINGS
" ---------------------------------------------------------------------------


" Other Options
set belloff=all
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/coverage/*
set wildmode=longest,list,full
set wildmenu
set vb
set showmode
set showmatch
set ignorecase
set smartindent
set incsearch
set ignorecase smartcase
set ts=2
set et
set softtabstop=2
set sw=2
set nowrap
set hlsearch
set nobackup
set nowritebackup
set noswapfile
set list listchars=tab:▸\ ,trail:·
set autoread
set showcmd
" set the default text width to 80
set textwidth=80
set laststatus=2
set winminwidth=10
set winwidth=79
set winheight=5
set noequalalways winminheight=5 winheight=9999 helpheight=9999
" uncomment to show line numbers in command line vim
set nu
"set nuw=4

" comment out to split left and top instead of right and below
set splitright
set splitbelow
set cursorline

" toggle paste mode with F2
set pastetoggle=<F2>

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" --------------------------------------------------------------------------
" CUSTOM AUTOCMDS
" --------------------------------------------------------------------------

augroup vimrcEx
  " clear all autocmds in the group
  autocmd!


  " FILE TYPES
  autocmd BufNewFile,BufRead *.sql set filetype=mysql
  autocmd BufNewFile,BufRead *.clj set filetype=clojure
  autocmd BufNewFile,BufRead *.thor set filetype=ruby
  autocmd BufNewFile,BufRead Gemfile set filetype=ruby
  autocmd BufNewFile,BufRead Rakefile set filetype=ruby
  autocmd BufNewFile,BufRead *.handlebars set filetype=html
  autocmd BufNewFile,BufRead *.hbs set filetype=html
  autocmd BufNewFile,BufRead *.eex set filetype=html
  autocmd BufNewFile,BufRead *.dasm set filetype=m65
  autocmd BufNewFile,BufRead *.md set filetype=markdown

  autocmd FileType objc set softtabstop=4 tabstop=4 shiftwidth=4
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()

augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme NeoSolarized
set termguicolors
let ayucolor="dark"
colorscheme ayu
let g:airline_theme='bubblegum'

" ---------------------------------------------------------------------------
" PLUGIN SETTINGS
" ---------------------------------------------------------------------------

" Dash Setting
let g:dash_map = { 'objc': 'iphoneos' }

" RustFmt Setting
let g:rustfmt_autosave = 1

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" this seems to fix rvm
set shell=/bin/bash

" ---------------------------------------------------------------------------
" MAPPINGS
" ---------------------------------------------------------------------------
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" " Indent if we're at the beginning of a line. Else, do completion.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>
"
" Set map leader to , instead of \
" Change this depending on your preference
noremap , \
noremap \ ,
let mapleader = ','
<<<<<<< HEAD
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = '\v[\/](src\/bower_components|dist)'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
function! MapCR()
  nnoremap <cr> :nohl<cr><cr>
endfunction
call MapCR()

nnoremap <leader><leader> <c-^>

" FZF settings
let g:fzf_layout = { 'down': '~20%' }
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

map <silent> <C-p> :Files<CR>

" comands to edit and reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sr :so $MYVIMRC<CR>

" open text files
nmap <leader>pn :sp $PWD/project-notes.md<cr>

" spell check
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" map git commands
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gb :Gblame<cr>
nmap <leader>sc :Scommit WIP<Space>

" move around with the arrow keys
noremap <silent> <Right> <c-w>l
noremap <silent> <Left> <c-w>h
noremap <silent> <Up> <c-w>k
noremap <silent> <Down> <c-w>j

" setup jsx
let g:jsx_ext_required = 0

" Toggle spell checking
noremap <silent> <leader>s :set spell!<cr>
