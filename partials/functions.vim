let mapleader=","

" Custom Functions
function! Review(...)
  echom "Starting review in new tab."
  let base = exists(a:0) ? a:0 : "develop"
  tabnew
  setlocal buftype=nofile bufhidden=hide noswapfile
  execute "r !git diff ". base ."..HEAD"
  setfiletype git
endfunction
command! Review call Review()

function! GuessDefinition()
  :grep '(def\|class\|module) <cword>' . "" . $GEM_HOME
  :copen
endfunction
command! GuessDefinition call GuessDefinition()
nnoremap <silent> gr :call GuessDefinition()<CR>

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

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Undotree
nnoremap <F5> :UndotreeToggle<cr>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>
" Open new split panes to right and bottom, which feels more natural set splitbelow set splitright
 " Quicker window movement nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


map <F2> :GitSessionSave <cr> " Quick write session with F2
map <F3> :GitSessionLoad <cr>     " And load session with F3

nnoremap <silent> F :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> R :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> <C-k> :call LanguageClient_workspace_symbol()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F7> :call LanguageClient_textDocument_rename()<CR>

nmap <C-Space> $zf%

source $HOME/dotfiles/partials/ruby_test.vim
