autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css.coffee
autocmd BufRead,BufNewFile *.md setlocal conceallevel=0
autocmd BufRead,BufNewFile *.rs nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
autocmd FileType rust nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>

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
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0


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
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'ruby': ['solargraph', 'stdio'],
    \ }

" \ 'clojure': ["bash", "-c", 'clojure-lsp'],

"let g:UltiSnipsExpandTrigger="<tab>"

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> H :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Ctrlp
let g:ctrlp_extensions = ['line']

" Fzf
nnoremap <C-p> :Ag<Enter>

" Rspec runner

if filereadable("./config/application.rb")
  let g:rspec_command = "Dispatch bundle exec spring rspec {spec}"
else
  let g:rspec_command = "Dispatch bundle exec rspec {spec}"
endif

" Ale fixers
let g:ale_linters = {'rust': ['rls', 'cargo'], 'clojure': ['joker']}
let g:ale_fixers = {'rust': ['cargo', 'rustfmt']}
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')

" enable ncm2 for all buffers
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
autocmd BufEnter * call ncm2#enable_for_buffer()
autocmd BufEnter * call deoplete#disable()
autocmd BufEnter *.clj call ncm2#disable_for_buffer()
autocmd BufEnter *.clj call deoplete#enable()
autocmd BufEnter *.clj let maplocalleader = 'ö'

" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
" inoremap <silent> <buffer> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" c-j c-k for moving in snippet
" let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
