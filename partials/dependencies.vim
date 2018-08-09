" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Utility and clients
Plugin 'tyru/open-browser.vim'
Plugin 'tpope/vim-endwise'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'ncm2/ncm2'
Plugin 'ncm2/ncm2-racer'
Plugin 'roxma/nvim-cm-racer'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'junegunn/fzf.vim', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'tpope/vim-dispatch'
Plugin 'mattn/webapi-vim'

" Code View and organization
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'majutsushi/tagbar'

" Code styling
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-surround'
Plugin 'yggdroot/indentline'
Plugin 'kien/rainbow_parentheses.vim'

" Language Specific Plugins
Plugin 'kchmck/vim-coffee-script'
Plugin 'leafgarland/typescript-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'vim-ruby/vim-ruby'
Plugin 'roxma/nvim-ascript'
Plugin 'tpope/vim-rvm'
Plugin 'tpope/vim-haml'
Plugin 'thoughtbot/vim-rspec'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'
Plugin 'clojure-vim/async-clj-omni'
"Plugin 'SevereOverfl0w/clojure-check', {'do': './install'}
Plugin 'itchyny/vim-haskell-indent'
Plugin 'posva/vim-vue'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'ElmCast/elm-vim'
Plugin 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call vundle#end()            " required
