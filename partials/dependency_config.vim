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

" Autoformat elm
let g:elm_format_autosave = 1

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Terminal inputs
tnoremap <Esc> <C-\><C-n>

" This weeks favorite colorscheme
" colorscheme railscasts
colorscheme railscasts
autocmd FileType * if &diff | colorscheme neverland2-darker | endif

" Show textwidth
set textwidth=120
set colorcolumn=+1

let g:LanguageClient_serverCommands = {
    \ 'rust':       ['rustup', 'run', 'nightly', 'rls'],
    \ 'lua': ['lua-lsp'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Ctrlp
let g:ctrlp_extensions = ['line']

" Fzf
nnoremap <C-p> :Ag<Enter>

" Rspec runner
let g:rspec_command = "Dispatch bundle exec spring rspec {spec}"

" Ale fixers
let b:ale_fixers = {'rust': ['rustfmt']}

" Ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()

" note that you must keep `noinsert` in completeopt, you must not use
" `longest`. The others are optional. Read `:help completeopt` for
" more info
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:UltiSnipsExpandTrigger = "<c-l>"
autocmd FileType rust nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
