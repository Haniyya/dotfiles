" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"let g:vundle_default_git_proto = 'git'
"call vundle#begin()
call plug#begin('~/.vim/plugged')
"Plug 'VundleVim/Vundle.vim'

" Utility and clients
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugs' }
Plug 'airblade/vim-gitgutter'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'jpalardy/vim-slime'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tyru/open-browser.vim'
Plug 'w0rp/ale'
Plug 'rottencandy/vimkubectl'

" Code View and organization
Plug 'AndrewRadev/splitjoin.vim'
Plug 'bling/vim-airline'
"Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'xolox/vim-misc'

" Code styling
Plug 'junegunn/vim-easy-align'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'yggdroot/indentline'
Plug 'arcticicestudio/nord-vim'

" Language Specific Plugs
Plug 'Olical/aniseed'
Plug 'Olical/conjure'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next',  'do': 'bash install.sh'  }
Plug 'bakpakin/fennel.vim'
Plug 'bhurlow/vim-parinfer'
Plug 'gorodinskiy/vim-coloresque'
Plug 'https://gitlab.com/HiPhish/guile.vim'
Plug 'itchyny/vim-haskell-indent'
Plug 'jparise/vim-graphql'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'leafgarland/typescript-vim'
Plug 'neovim/nvim-lsp'
Plug 'noprompt/vim-yardoc'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'
Plug 'solarnz/thrift.vim'
Plug 'tbastos/vim-lua'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tjvr/vim-nearley'
Plug 'niklasl/vim-rdf'
call plug#end()            " required
