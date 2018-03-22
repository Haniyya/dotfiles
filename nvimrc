source $HOME/dotfiles/partials/configuration.vim
source $HOME/dotfiles/partials/dependencies.vim
source $HOME/dotfiles/partials/dependency_config.vim
source $HOME/dotfiles/partials/functions.vim
source $HOME/dotfiles/partials/display.vim

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
