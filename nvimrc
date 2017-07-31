set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Plugin 'ervandew/supertab'
"Plugin 'Shougo/neocomplete'
Plugin 'Shougo/vimproc.vim'

" Utility and clients
Plugin 'tpope/vim-endwise'
Plugin 'benekastah/neomake'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'shougo/deoplete.nvim'
Plugin 'danro/rename.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'
Plugin 'jiangmiao/auto-pairs'
Plugin 'majutsushi/tagbar'
Plugin 'wting/gitsessions.vim'

" Code View and organization
Plugin 'scrooloose/nerdtree'
Plugin 'xolox/vim-notes'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jceb/vim-orgmode'
Plugin 'junegunn/goyo.vim'

" Code styling
Plugin 'junegunn/vim-easy-align'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/limelight.vim'

" Language Specific Plugins
Plugin 'QMonkey/monkey-vim'
Plugin 'rawsource/Monkey-VIM'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'sebastianmarkow/deoplete-rust'
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'xolox/vim-misc'
Plugin 'leafo/moonscript-vim'
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'rhysd/vim-crystal'
Plugin 'kchmck/vim-coffee-script'
Plugin 'shime/vim-livedown'
Plugin 'mattn/emmet-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'vim-ruby/vim-ruby'
Plugin 'rust-lang/rust.vim'
Plugin 'tpope/vim-rvm'
Plugin 'tpope/vim-haml'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'pangloss/vim-javascript'
Plugin 'burnettk/vim-angular'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'noprompt/vim-yardoc'
Plugin 'racer-rust/vim-racer'
Plugin 'lervag/vimtex'
Plugin 'elmcast/elm-vim'
Plugin 'zchee/deoplete-clang'
Plugin 'elixir-lang/vim-elixir'
Plugin 'c.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'itchyny/vim-haskell-indent'
Plugin 'posva/vim-vue'
call vundle#end()            " required
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

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

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

  autocmd FileType typescript JsPreTmpl html
  autocmd FileType typescript syn clear foldBraces

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

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"Numbers
set number
set numberwidth=5

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-rspec mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
" Open new split panes to right and bottom, which feels more natural set splitbelow set splitright " Quicker window movement nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


map <F2> :GitSessionSave <cr> " Quick write session with F2
map <F3> :GitSessionLoad <cr>     " And load session with F3

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
set runtimepath^=~/.vim/bundle/ctrlp.vim

set t_Co=256
set statusline+=%#warningmsg#

" Airline Config
"set statusline+=%{SyntasticStatuslineFlag()}
"let g:airline_section_b = '%{strftime("%c")}'
"let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'
let g:airline#extensions#tabline#enabled = 1

"Set Bash as shell
set shell=zsh

"Rust settings
let g:racer_cmd = "racer"
let $RUST_SRC_PATH="/home/paul/rust/src"
let g:user_emmet_leader_key='<C-Z>'
let g:clang_user_options='|| exit 0'
let g:clang_complete_copen=1
let g:clang_hl_errors=1
au BufNewFile,BufRead *.rs set filetype=rust

" Ruby settings
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_use_bundler = 1

" Markdown config
let g:vim_markdown_folding_disabled = 1

" Language German by default
set spelllang=de

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

set number
set relativenumber

" Indent Guides stuff
set ts=2 sw=2 et
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
let g:indent_guides_start_level = 2

" Neomake Settings
let g:neomake_echo_current_error=1
let g:neomake_verbose=0
let g:neomake_ruby_enabled_makers         = ['mri', 'rubocop']
let g:neomake_rust_enabled_makers         = []
let g:neomake_javascript_enabled_makers   = ['eslint']
let g:neomake_haskell_enabled_makers      = ['hlint', 'ghcmod']
let g:neomake_coffee_enabled_makers = ['coffeelint']
let g:neomake_latex_enabled_makers        = ['lacheck']
let g:neomake_moon_enabled_makers        = []
let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }
autocmd! BufWritePost,BufEnter * Neomake
autocmd! BufWritePost *.rs NeomakeProject cargo

" define elm-make maker
let g:neomake_elm_elmmake_maker = {
  \ 'exe': 'elm-make',
  \ 'buffer_output': 1,
  \ 'errorformat':
    \ '%E%.%#--\ %m\ -%# %f' . ',' .
    \ '%C%l\\|' . ',' .
    \ '%C%.%#'
\ }

" enable elm-make on elm
let g:neomake_elm_enabled_makers = [ 'elmmake' ]

" use neomake to build different files
augroup neomake_neomake_build
  autocmd! BufRead,BufWritePost *.elm Neomake elmmake
augroup end

" Autoformat elm
let g:elm_format_autosave = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" Deoplete Rust
let g:deoplete#sources#rust#racer_binary='/home/paul/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/paul/rust/src'

" Tagbar
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

 let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits,traits',
        \'i:impls,trait implementations',
    \]
    \}

" Deoplete vimtex
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = '\\(?:'
      \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
      \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
      \ . '|hyperref\s*\[[^]]*'
      \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
      \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
      \ .')'

let g:lua_check_syntax = 0
let g:lua_complete_omni = 1
let g:lua_complete_dynamic = 0
let g:lua_define_completion_mappings = 0

if !exists('g:deoplete#omni#functions')
  let g:deoplete#omni#functions = {}
endif
let g:deoplete#omni#functions.lua = 'xolox#lua#omnifunc'
let g:deoplete#omni#functions.ruby = 'rubycomplete#Complete'
"let g:deoplete#omni#functions.lua = 'xolox#lua#completefunc'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Terminal inputs
tnoremap <Esc> <C-\><C-n>

" This weeks favorite colorscheme
colorscheme sol

" Custom Functions
function Review()
  echom "Starting review in new tab."
  tabnew
  r !git diff develop..HEAD
  setfiletype git
endfunction
