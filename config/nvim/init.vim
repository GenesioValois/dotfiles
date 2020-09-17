let vimdir = '~/.config/nvim/'
let was_installed = 1

if !filereadable(expand(vimdir . "autoload/plug.vim"))
  call system('curl -fLo ' . vimdir . 'autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  execute 'source ' . vimdir . 'autoload/plug.vim'
  let was_installed = 0
endif

call plug#begin('~/.vim/plugged')
" Airline for the tabs
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'honza/vim-snippets'
" Comment in/out stuff easily
Plug 'tomtom/tcomment_vim'
" Auto close pairs
Plug 'jiangmiao/auto-pairs'
" " Ctags
" Plug 'ludovicchabant/vim-gutentags'
" Unpaired
Plug 'tpope/vim-unimpaired'
" Git Diff
Plug 'airblade/vim-gitgutter'
" Show lines changed
Plug 'airblade/vim-gitgutter'
" Multple cursors is hot
Plug 'terryma/vim-multiple-cursors'
""" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
" CoolIcons
Plug 'ryanoasis/vim-devicons'
" Polyglot
Plug 'sheerun/vim-polyglot'
" Ruby
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'ngmy/vim-rubocop'
Plug 'tpope/vim-cucumber'
Plug 'janko-m/vim-test'
" Multiple cursors
Plug 'terryma/vim-multiple-cursors'
" Change background of inactive windows
Plug 'blueyed/vim-diminactive'

" Colorschemes/themes
Plug 'morhetz/gruvbox'

" Display indent steps
Plug 'Yggdroot/indentLine'
" Add end to ruby blocks automatically
Plug 'tpope/vim-endwise'
" Make . work with surround (and other plugins)
Plug 'tpope/vim-repeat'
" Git
Plug 'tpope/vim-fugitive'
" Easily change delimiters
Plug 'tpope/vim-surround'
" Highlight colors
Plug 'ap/vim-css-color'
" Automatically change dir when opening files
Plug 'airblade/vim-rooter'
" Many handy text objects
Plug 'wellle/targets.vim'
" Ruby blocks text object
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
"whitespace
Plug 'ntpeters/vim-better-whitespace'
" JSX support
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
"buffer files
Plug 'Shougo/denite.nvim'
" splitjoin
Plug 'AndrewRadev/splitjoin.vim'
" using ctrl + h/j/k/l on tmux
Plug 'christoomey/vim-tmux-navigator'
" utils
Plug 'mattn/emmet-vim'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'

" autocomplete
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'tpope/vim-eunuch'

Plug 'mhinz/vim-startify'
call plug#end()

if !was_installed
  PlugInstall
endif

set encoding=utf8

let g:mapleader=","
let mapleader=","

set number
set relativenumber
set autoread
set ruler
colorscheme gruvbox

set termguicolors
set background=dark
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/
set cursorline!
set wrap
set textwidth=99
set formatoptions=tcqrn1
set noshiftround
set lazyredraw

set hidden
set mouse=a

" set diff options
set diffopt=filler,vertical

" Status bar
set laststatus=2

" turn on syntax highlighting
syntax on
" highlight to vim-clojure-static
filetype plugin indent on

" Turn off swap and backup files
set noswapfile
set nobackup
set nowb

" Indentation
set autoindent
set smartindent
set smartcase

" Last line
set showmode
set showcmd

" Share the clipboard outside of macvim
set clipboard+=unnamedplus

" Highlight search results
" set hlsearch
set nohlsearch

" Disable bloated stuff that is on by default.
let g:loaded_2html_plugin = 1
let g:loaded_gzip = 1
let g:loaded_tarPlugin = 1 " May cause problems with fireplace
let g:loaded_zipPlugin = 1
let g:loaded_netrwPlugin = 1

" airline
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:tmuxline_preset = 'full'
" install nerd font

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" better whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" update time to refresh gitgutter
set updatetime=100

" indentLine config
set conceallevel=1
let g:indentLine_conceallevel=1

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Make it obvious where 80 characters is
" at deco we use 100
set textwidth=99
set colorcolumn=+1

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" coc configurations and plugins
let g:coc_global_extensions = ['coc-eslint', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-solargraph']

so ~/.config/nvim/mappings.vim
