" Airline Config
"set statusline+=%{SyntasticStatuslineFlag()}
"let g:airline_section_b = '%{strftime("%c")}'
"let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'
let g:airline#extensions#tabline#enabled = 1

" set jsx highlighting in js files
let g:jsx_ext_required = 0

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

" Indent Guides stuff
set ts=2 sw=2 et
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
let g:indent_guides_start_level = 2

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
" let g:deoplete#complete_method = "omnifunc"
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#auto_complete_start_length = 0
" Deoplete Rust
let g:deoplete#sources#rust#show_duplicates=0
let g:deoplete#sources#rust#racer_binary=$HOME . "/.cargo/bin/racer"
let g:deoplete#sources#rust#rust_source_path=$HOME . "/rust/src"

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

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

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
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.ruby = 'rubycomplete#Complete'
let g:deoplete#omni#functions.lua = 'xolox#lua#completefunc'

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
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'haskell':    ['hie', '--lsp'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1
