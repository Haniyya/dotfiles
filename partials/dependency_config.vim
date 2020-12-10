set hidden

autocmd BufRead,BufNewFile *.md setlocal conceallevel=0

" Vue syntax stuff
let g:vim_vue_plugin_load_full_syntax = 1
let g:vim_vue_plugin_use_typescript = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Airline Config
let g:airline#extensions#tabline#enabled = 1

"Rust settings
"let g:racer_cmd = "racer"
"let g:user_emmet_leader_key='<C-Z>'
"let g:rustfmt_autosave = 1
"let g:clang_user_options='|| exit 0'
"let g:clang_complete_copen=1
"let g:clang_hl_errors=1

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

" Show textwidth
set textwidth=120
set colorcolumn=+1

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent>gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
    \ 'ruby': ['/usr/local/var/rbenv/shims/solargraph', 'stdio'],
    \ 'rust': ['rust-analyzer-mac'],
    \ 'typescript': ['typescript-language-server', '--stdio'],
    \ 'vue': ['vls'],
    \ }

" Ctrlp
let g:ctrlp_extensions = ['line']

" Fzf
nnoremap <C-p> :Ag<Enter>

" Rspec runner

function! s:spring_available()
  if filereadable("Gemfile") && executable("bundle")
    if system("bundle list") =~? 'spring'
      return 1
    end
  end
endfunction

if s:spring_available()
  let g:rspec_command = "Dispatch bundle exec spring rspec {spec} --format progress"
else
  let g:rspec_command = "Dispatch bundle exec rspec {spec} --format progress"
endif

" Ale fixers
let g:ale_linters = {'rust': ['rls', 'cargo'], 'clojure': ['joker'], 'ruby': ['standardrb']}
let g:ale_fixers = {'rust': ['cargo', 'rustfmt']}
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
let g:ale_ruby_standardrb_executable = 'bundle'


let g:conjure#mapping#def_word = "gc"

autocmd BufEnter *.clj let maplocalleader = ','
autocmd BufEnter *.cljs let maplocalleader = ','

lua <<EOF
  require'nvim_lsp'.solargraph.setup{}
EOF
