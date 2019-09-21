if &compatible
  set nocompatible
endif
" install plugins using dein
set runtimepath+=/Users/josephjackson/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/josephjackson/.cache/dein')
  call dein#begin('/Users/josephjackson/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/josephjackson/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('/Users/josephjackson/.cache/dein')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/denite.nvim')

  " Completions
  " call dein#add('sebastianmarkow/deoplete-rust')
  call dein#add('racer-rust/vim-racer')

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('elixir-lang/vim-elixir')
  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('mhartington/nvim-typescript', { 'build': './install.sh' })
  call dein#add('ngmy/vim-rubocop')
  call dein#add('rust-lang/rust.vim')
  call dein#add('fatih/vim-go')

  " Expansion
  call dein#add('mattn/emmet-vim')

  call dein#add('majutsushi/tagbar')

  call dein#add('rizzatti/dash.vim')

  call dein#add('bling/vim-airline')
  call dein#add('rking/ag.vim')
  call dein#add('scrooloose/syntastic')
  call dein#add('tpope/vim-endwise')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-commentary')
  call dein#add('kien/ctrlp.vim')

  call dein#add('iCyMind/NeoSolarized')
  call dein#add('ayu-theme/ayu-vim')
  call dein#add('vim-airline/vim-airline-themes')

  call dein#add('vimwiki/vimwiki')

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


" jsx support
let g:jsx_ext_required = 0
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

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
  autocmd BufNewFile,BufRead *.json set filetype=javascript
  autocmd BufNewFile,BufRead *.jsx set filetype=javascript
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

" Deocomplete
let g:deoplete#enable_at_startup = 1
" if executable('racer')
"   let g:deoplete#sources#rust#racer_binary = systemlist('which racer')[0]
" endif

" if executable('rustc')
"   " if src installed via rustup, we can get it by running 
"   " rustc --print sysroot then appending the rest of the path
"   let rustc_root = systemlist('rustc --print sysroot')[0]
"   let rustc_src_dir = rustc_root . '/lib/rustlib/src/rust/src'
"   if isdirectory(rustc_src_dir)
"     let g:deoplete#sources#rust#rust_source_path = rustc_src_dir
"   endif
" endif

" let g:deoplete#sources#rust#show_duplicates=1
" let g:deoplete#sources#rust#documentation_max_height=20
let g:racer_experimental_completer = 1

" Dash Setting
let g:dash_map = { 'objc': 'iphoneos' }

" RustFmt Setting
let g:rustfmt_autosave = 1

" syntastic warnings
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_mode_map={ 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['html', 'vimwiki', 'vim'] }
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

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
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = '\v[\/](src\/bower_components|dist)'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
function! MapCR()
  nnoremap <cr> :nohl<cr><cr>
endfunction
call MapCR()

nnoremap <leader><leader> <c-^>

" comands to edit and reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sr :so $MYVIMRC<CR>

" open text files
nmap <leader>pn :sp $PWD/project-notes.md<cr>

" dash
nmap <silent> <leader>dd <Plug>DashSearch
nmap <silent> <leader>dg <Plug>DashGlobalSearch

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
