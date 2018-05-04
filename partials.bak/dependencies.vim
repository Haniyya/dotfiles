" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Plugin 'ervandew/supertab'
"Plugin 'Shougo/neocomplete'
Plugin 'Shougo/vimproc.vim'

" Utility and clients
Plugin 'tpope/vim-endwise'
Plugin 'neomake/neomake'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'junegunn/fzf'
Plugin 'danro/rename.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'
Plugin 'jiangmiao/auto-pairs'
Plugin 'majutsushi/tagbar'
Plugin 'wting/gitsessions.vim'
Plugin 'vitalk/vim-simple-todo'
Plugin 'mbbill/undotree'
Plugin 'craigemery/vim-autotag'

" Code View and organization
Plugin 'scrooloose/nerdtree'
Plugin 'xolox/vim-notes'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'jceb/vim-orgmode'
Plugin 'junegunn/goyo.vim'

" Code styling
Plugin 'junegunn/vim-easy-align'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/limelight.vim'

" Language Specific Plugins
Plugin 'leafgarland/typescript-vim'
Plugin 'xolox/vim-misc'
Plugin 'leafo/moonscript-vim'
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'rhysd/vim-crystal'
Plugin 'kchmck/vim-coffee-script'
Plugin 'shime/vim-livedown'
Plugin 'mattn/emmet-vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rvm'
Plugin 'tpope/vim-haml'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'pangloss/vim-javascript'
Plugin 'burnettk/vim-angular'
Plugin 'noprompt/vim-yardoc'
Plugin 'lervag/vimtex'
Plugin 'elmcast/elm-vim'
Plugin 'zchee/deoplete-clang'
Plugin 'elixir-lang/vim-elixir'
Plugin 'c.vim'
Plugin 'cpp.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'clojure-vim/async-clj-omni'
Plugin 'itchyny/vim-haskell-indent'
Plugin 'posva/vim-vue'
Plugin 'davidhalter/jedi-vim'
Plugin 'python-mode/python-mode'
Plugin 'hallison/vim-rdoc'
Plugin 'chrisbra/Colorizer'
Plugin 'neoclide/vim-jsx-improve'
Plugin 'carlitux/deoplete-ternjs'
Plugin 'sebastianmarkow/deoplete-rust'
Plugin 'tclem/vim-arduino'
Plugin 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call vundle#end()            " required
