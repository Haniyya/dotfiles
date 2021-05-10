" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
let g:vundle_default_git_proto = 'git'
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Utility and clients
Plugin 'tyru/open-browser.vim'
Plugin 'tpope/vim-endwise'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'mattn/webapi-vim'
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'janko-m/vim-test'

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
Plugin 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plugin 'akinsho/nvim-bufferline.lua'

" Language Specific Plugins
Plugin 'cstrahan/vim-capnp'
Plugin 'solarnz/thrift.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'leafgarland/typescript-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rvm'
Plugin 'tpope/vim-haml'
Plugin 'thoughtbot/vim-rspec'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'tbastos/vim-lua'
Plugin 'itchyny/vim-haskell-indent'
Plugin 'leafOfTree/vim-vue-plugin'
Plugin 'gorodinskiy/vim-coloresque'
"Plugin 'ElmCast/elm-vim'
Plugin 'kylef/apiblueprint.vim'
Plugin 'ron-rs/ron.vim'
Plugin 'bakpakin/fennel.vim'
Plugin 'bhurlow/vim-parinfer'
Plugin 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plugin 'neovim/nvim-lsp'
Plugin 'Olical/conjure', { 'do': 'bin/compile'  }
Plugin 'jparise/vim-graphql'
Plugin 'bakpakin/janet.vim'
call vundle#end()            " required
