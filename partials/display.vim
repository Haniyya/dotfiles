set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
syntax enable
filetype plugin indent on    " required

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.coffee set filetype=coffee
  autocmd BufRead,BufNewFile *.elm set filetype=elm
  autocmd BufRead,BufNewFile *.rake set filetype=ruby
  autocmd BufRead,BufNewFile *.thor set filetype=ruby
  autocmd BufRead,BufNewFile *.cr set filetype=crystal
  autocmd BufRead,BufNewFile *.exs set filetype=elixir
  autocmd BufRead,BufNewFile *.ex set filetype=elixir
  autocmd BufRead,BufNewFile *.vue set filetype=vue
  autocmd BufRead,BufNewFile *.moon set filetype=moon
  autocmd BufRead,BufNewFile *.ts set filetype=typescript

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell
  autocmd FileType latex setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>
set numberwidth=5
set number
set relativenumber
set hidden

set t_Co=256
set statusline+=%#warningmsg#

" This weeks favorite colorscheme
" colorscheme railscasts
colorscheme gruvbox
autocmd FileType * if &diff | colorscheme neverland2-darker | endif

" Show textwidth
set textwidth=120
set colorcolumn=+1

" Indent Guides stuff
set ts=2 sw=2 et
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
let g:indent_guides_start_level = 2

set termguicolors
