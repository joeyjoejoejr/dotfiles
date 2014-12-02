" vim instead of vi
set nocompatible

" using vundle to load all plugins
if filereadable(expand("~/.vundle"))
  source ~/.vundle
endif

" enable syntax highlighting and file type detection
syntax on
filetype plugin indent on

" ---------------------------------------------------------------------------
" BASIC SETTINGS
" ---------------------------------------------------------------------------

" Colorscheme options
colorscheme default

" Other Options
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
set list listchars=tab:\ \ ,trail:·
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
  autocmd BufNewFile,BufRead *.thor set filetype=ruby
  autocmd BufNewFile,BufRead Gemfile set filetype=ruby
  autocmd BufNewFile,BufRead Rakefile set filetype=ruby
  autocmd BufNewFile,BufRead *.handlebars set filetype=html
  autocmd BufNewFile,BufRead *.hbs set filetype=html
  autocmd BufNewFile,BufRead *.eex set filetype=html

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
:set t_Co=256 " 256 colors
:set background=dark

" ---------------------------------------------------------------------------
" PLUGIN SETTINGS
" ---------------------------------------------------------------------------

" Dash Setting
let g:dash_map = { 'objc': 'iphoneos' }

" syntastic warnings
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_mode_map={ 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['html', 'vimwiki', 'vim'] }

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" gundo undo visualizer
nnoremap <F5> :GundoToggle<CR>

" this seems to fix rvm
set shell=/bin/bash

" clang_complete settings
" let g:clang_complete_auto = 0
" let g:clang_use_library = 1
" let g:clang_periodic_quickfix = 0
" let g:clang_close_preview = 1
" let g:clang_snippets = 1

" let g:clang_exec = '/Users/joe/.vim/bundle/clang_complete/clang/bin'
" let g:clang_library_path = '/Users/joe/.vim/bundle/clang_complete/clang/lib'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! MapCR()
"   nnoremap <cr> :call RunTestFile()<cr>
" endfunction
" call MapCR()

" nnoremap <leader>T :call RunNearestTest()<cr>
" nnoremap <leader>a :call RunTests('')<cr>
" nnoremap <leader>c :w\|:!script/features<cr>
" nnoremap <leader>w :w\|:!script/features --profile wip<cr>

" function! RunTestFile(...)
"     if a:0
"         let command_suffix = a:1
"     else
"         let command_suffix = ""
"     endif

"     " Run the tests for the previously-marked file.
"     let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
"     if in_test_file
"         call SetTestFile()
"     elseif !exists("t:grb_test_file")
"         return
"     end
"     call RunTests(t:grb_test_file . command_suffix)
" endfunction

" function! RunNearestTest()
"     let spec_line_number = line('.')
"     call RunTestFile(":" . spec_line_number)
" endfunction

" function! SetTestFile()
"     " Set the spec file that tests will be run for.
"     let t:grb_test_file=@%
" endfunction

" function! RunTests(filename)
"     " Write the file and run tests for the given filename
"     if expand("%") != ""
"       :w
"     end
"     if match(a:filename, '\.feature$') != -1
"         exec ":!script/features " . a:filename
"     else
"         " First choice: project-specific test script
"         if filereadable("script/test")
"             exec ":!script/test " . a:filename
"         " Fall back to the .test-commands pipe if available, assuming someone
"         " is reading the other side and running the commands
"         elseif filewritable(".test-commands")
"           let cmd = 'rspec --color --format progress --require "~/lib/vim_rspec_formatter" --format VimFormatter --out tmp/quickfix'
"           exec ":!echo " . cmd . " " . a:filename . " > .test-commands"

"           " Write an empty string to block until the command completes
"           sleep 100m " milliseconds
"           :!echo > .test-commands
"           redraw!
"         " Fall back to a blocking test run with Bundler
"         elseif filereadable("Gemfile")
"             exec ":!bundle exec rspec --color " . a:filename
"         " Fall back to a normal blocking test run
"         else
"             exec ":!rspec --color " . a:filename
"         end
"     end
" endfunction

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
function! MapCR()
  nnoremap <cr> :nohl<cr><cr>
endfunction
call MapCR()

nnoremap <leader><leader> <c-^>

" comands to edit and reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sr :so $MYVIMRC<CR>

" open text files
nmap <leader>pn :sp $PWD/project-notes.txt<cr>
nmap <leader>sn :sp ~/Documents/tool-sharpening-list.md<cr>

" Custom Git Command to run tests and commit with message
command! -nargs=1 Scommit silent execute '!testandcommit' <f-args> '&>/dev/null' '&' | redraw!

" dash
nmap <silent> <leader>dd <Plug>DashSearch
nmap <silent> <leader>dg <Plug>DashGlobalSearch

" smart square brackets for objc methods
imap <C-]> <Esc>yss]$i
"
" Objective-C related tasks bindings
nmap <leader>x :!rake xcode_build<CR>
nmap <leader>r :!rake simulator<CR>
nmap <leader>ll :!rake debug<CR>
nmap <leader>cl :!rake clang_db<CR>

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
