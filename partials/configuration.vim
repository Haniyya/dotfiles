" Use The ripgrep https://github.com/BurntSushi/ripgrep
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
  " Use Rg over Grep
  set grepprg=rg\ --vimgrep\ --no-messages\ -e
endif

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

"Set Bash as shell
set shell=zsh

" Language German by default
set spelllang=en

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

set t_Co=256 " 256 colors
