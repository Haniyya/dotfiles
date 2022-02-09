set hidden

let maplocalleader = ','
let mapleader = ','

autocmd BufRead,BufNewFile *.md setlocal conceallevel=0


 "Vue syntax stuff
let g:vim_vue_plugin_load_full_syntax = 1
let g:vim_vue_plugin_use_typescript = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Airline Config
let g:airline#extensions#tabline#enabled = 1

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
let g:elm_format_autosave = 0

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


let g:_VIM_PARINFER_DEFAULTS = {
    \ 'globs':      ['*.clj', '*.cljs', '*.cljc', '*.edn', '*.el', '*.hl', '*.lisp', '*.rkt', '*.ss', '*.lfe', '*.fnl', '*.fennel', '*.carp', '*.janet'],
    \ 'filetypes':  ['clojure', 'racket', 'lisp', 'scheme', 'lfe', 'fennel'],
    \ 'mode':       "indent",
    \ 'script_dir': resolve(expand("<sfile>:p:h:h"))
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
    \ 'ruby': ['/usr/local/var/rbenv/shims/solargraph', 'stdio'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rust-analyzer'],
    \ 'typescript': ['typescript-language-server', '--stdio'],
    \ 'javascript': ['typescript-language-server', '--stdio'],
    \ 'vue': ['vls'],
    \ 'elm': ['elm-language-server'],
    \ 'lua': ['lua-language-server']
    \ }

let g:LanguageClient_rootMarkers = {
  \ 'elm': ['elm.json'],
  \ 'ruby': ['*.gemspec', 'Gemfile'],
  \ }

" Ctrlp
let g:ctrlp_extensions = ['line']

" Fzf
nnoremap <C-p> :Rg<Enter>

" Rspec runner

function! s:spring_available()
  if filereadable("Gemfile") && executable("bundle")
    if system("bundle list") =~? 'spring'
      return 1
    end
  end
endfunction

if s:spring_available()
  let test#ruby#rspec#executable = "bundle exec spring rspec"
endif

let test#javascript#jest#options = "--no-interactive --no-status"

" test stuff
" make test commands execute using dispatch.vim
let test#strategy = "dispatch"
let test#ruby#rspec#options = '--format progress'
"autocmd BufEnter *.rb let test#project_root = finddir('lib/..', expand('%:p:h').';')

nmap <leader>f :TestFile<CR>
nmap <leader>t :TestNearest<CR>
nmap <leader>s :TestSuite<CR>
nmap <leader>l :TestLast<CR>
nmap <leader>g :TestVisit<CR>

" Ale fixers
let g:ale_linters = {'rust': ['rls', 'cargo'], 'clojure': ['joker'], 'ruby': ['rubocop']}
let g:ale_fixers = {'rust': ['cargo', 'rustfmt'], 'elm': ['elm-format']} 
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
let g:ale_ruby_standardrb_executable = 'bundle'


let g:conjure#mapping#def_word = "gc"
let g:conjure#filetype#scheme = "conjure.client.guile.socket"
let g:conjure#client#guile#socket#pipename = ".guile-repl.socket"

autocmd BufEnter *.clj let maplocalleader = ','
autocmd BufEnter *.cljs let maplocalleader = ','

let g:rustfmt_autosave = 1

let g:aniseed#env = v:true

let g:slime_target = "neovim"

lua <<EOF
  require'nvim-treesitter.configs'.setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = "maintained",

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- List of parsers to ignore installing
    ignore_install = { },

    highlight = {
      -- `false` will disable the whole extension
      enable = true,

      -- list of language that will be disabled
      disable = {  },

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
  }
EOF

" TagBar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_show_visibility = 1
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ],
        \ 'ctagsbin':  'ripper-tags',
        \ 'ctagsargs': ['-f', '-']
\ }
