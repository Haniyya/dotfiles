" Airline Config
let g:airline#extensions#tabline#enabled = 1

"Rust settings
let g:racer_cmd = "racer"
let $RUST_SRC_PATH="/home/paul/rust/src"
let g:user_emmet_leader_key='<C-Z>'
let g:rustfmt_autosave = 1
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

" Neomake Settings
let g:neomake_echo_current_error=1
let g:neomake_verbose=0
let g:neomake_ruby_enabled_makers       = ['mri', 'rubocop']
let g:neomake_rust_enabled_makers       = ['cargo']
let g:neomake_javascript_enabled_makers = ['eslint']
"let g:neomake_haskell_enabled_makers    = ['hlint']
let g:neomake_coffee_enabled_makers     = ['coffeelint']
let g:neomake_latex_enabled_makers      = ['lacheck']
let g:neomake_moon_enabled_makers       = []
let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }
"autocmd! BufWritePost,BufEnter * Neomake
"autocmd! BufWritePost *.rs NeomakeProject cargo

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

" (Assuming settings like the following)
let g:deoplete#omni#functions = {}
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['file', 'neosnippet']
let g:deoplete#omni#input_patterns = {}

" Use deoplete.
let g:deoplete#complete_method = "omnifunc"
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#auto_complete_start_length = 0
" Deoplete Rust
let g:deoplete#sources#rust#show_duplicates=0
let g:deoplete#sources#rust#racer_binary=$HOME . "/.cargo/bin/racer"
let g:deoplete#sources#rust#rust_source_path=$HOME . "/rust/src"

let g:deoplete#omni#functions      = {}
let g:deoplete#omni#functions.ruby = 'rubycomplete#Complete'
let g:deoplete#omni#functions.lua  = 'xolox#lua#completefunc'

let g:deoplete#omni#functions.elm = ['elm#Complete']
let g:deoplete#omni#input_patterns.elm = '[^ \t]+'
let g:deoplete#sources.elm = ['omni'] + g:deoplete#sources._

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Terminal inputs
tnoremap <Esc> <C-\><C-n>

" This weeks favorite colorscheme
" colorscheme railscasts
colorscheme Tomorrow-Night
autocmd FileType * if &diff | colorscheme neverland2-darker | endif

" Show textwidth
set textwidth=120
set colorcolumn=+1

let g:LanguageClient_serverCommands = {
    \ 'rust':       ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'clojure':    ['clojure-lsp'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Ctrlp
let g:ctrlp_extensions = ['line']

" Fzf
nnoremap <C-p> :Ag<Enter>

" Rspec runner
let g:rspec_command = "Dispatch bundle exec spring rspec {spec}"

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
