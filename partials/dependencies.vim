" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"let g:vundle_default_git_proto = 'git'
"call vundle#begin()
call plug#begin('~/.vim/plugged')
"Plug 'VundleVim/Vundle.vim'

" Utility and clients
Plug 'tyru/open-browser.vim'
Plug 'tpope/vim-endwise'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-dispatch'
"Plug 'mattn/webapi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugs' }
Plug 'janko-m/vim-test'

" Code View and organization
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'bling/vim-airline'
Plug 'xolox/vim-misc'

" Code styling
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'yggdroot/indentline'

" Language Specific Plugs
Plug 'solarnz/thrift.vim'
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'thoughtbot/vim-rspec'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tbastos/vim-lua'
Plug 'itchyny/vim-haskell-indent'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'gorodinskiy/vim-coloresque'
Plug 'bakpakin/fennel.vim'
Plug 'bhurlow/vim-parinfer'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'neovim/nvim-lsp'
Plug 'Olical/conjure', { 'do': 'bin/compile'  }
Plug 'jparise/vim-graphql'
call plug#end()            " required
