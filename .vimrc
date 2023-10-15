" use colors that look best with the current terminal (doesn't always detect correctly)
set background&

" don't make a backup before overwriting a file
set nobackup
" make a backup while writing the file
set writebackup
" don't create a swapfile
set noswapfile

" turn all bells off
set belloff=all
" same as this i guess
"set vb t_vb=

syntax enable

" use plugin and indent detection of current filetype / no need for
" autoindent/cindent, as this should automatically take care of it
filetype plugin indent on

" use vim
set nocompatible

" maybe only use wrap in md files
" wrap lines
set wrap
" indent wrapped lines
set breakindent
set linebreak
set showbreak=

" move by line on the screen rather than by line in the file
" was acting weird right now, when going down also going one to the right
noremap j gj
noremap k gk
set smoothscroll " has problems with scrolloff but its okay for now

" try this i guess, may be problematic with wrap. lets see
set concealcursor=nc
" use 2 for hiding *returns* in md
set conceallevel=2

" no need, just use !
set noconfirm

" better rely on expandtab for indenting
set nocopyindent
set nopreserveindent

" spaces only
" (https://web.archive.org/web/20230831154632/https://gist.github.com/LunarLambda/4c444238fb364509b72cfb891979f1dd)
set expandtab
set tabstop=2      " Optional, if you want files with tabs to look the same too.
set shiftwidth=2
set softtabstop=-1 " Use value of shiftwidth
set smarttab       " Always use shiftwidth

" i don't want folds
set nofoldenable

" ensure safely writing files
set fsync

" ensure substitute works as intended
set nogdefault

" highlight search hits
set hlsearch
set incsearch

" ignore case when searching except when using a capitalized letter
set ignorecase
set smartcase

" search wrap
set wrapscan

" could be useful if configured nicely
"set listchars=

" don't use line numbers
set nonumber
set norelativenumber

" need ruler
set ruler
" config this
"set rulerformat=
" could be interesting
"set statusline=
"set tabline

" number of lines to keep above and below cursor
set scrolloff=4

" show mode
set showmode

" could be used for writing markdown
"set spell
"set spelllang=en,de

" normally should be a fast terminal connection
set ttyfast

" better command-line completion
set wildmenu

" only load plugins if Plug detected
if filereadable(expand("~/.vim/autoload/plug.vim"))

  call plug#begin()
  " The default plugin directory will be as follows:
  "   - Vim (Linux/macOS): '~/.vim/plugged'
  "   - Vim (Windows): '~/vimfiles/plugged'
  "   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
  " You can specify a custom plugin directory by passing it as the argument
  "   - e.g. `call plug#begin('~/.vim/plugged')`
  "   - Avoid using standard Vim directory names like 'plugin'

  " Make sure you use single quotes

  " vim-go
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " markdown
  Plug 'godlygeek/tabular'
  Plug 'preservim/vim-markdown'

  " shfmt
  Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }

  " syntax checking
  Plug 'dense-analysis/ale'

  " Initialize plugin system
  " - Automatically executes `filetype plugin indent on` and `syntax enable`.
  call plug#end()
  " You can revert the settings after the call like so:
  "   filetype indent off   " Disable file-type-specific indentation
  "   syntax off            " Disable syntax highlighting

  " vim-markdown
  " disable math conceal with LaTeX math syntax enabled
  let g:tex_conceal = ""
  let g:vim_markdown_math = 1
  " Disabling conceal for code fences
  let g:vim_markdown_conceal_code_blocks = 0

  " shfmt
  " google shell guideline
  let g:shfmt_extra_args = '-i 2 -ci'
  " auto format on save
  let g:shfmt_fmt_on_save = 1

  " vim-go
  let g:go_fmt_fail_silently = 0
  let g:go_fmt_command = 'goimports'
  let g:go_fmt_autosave = 1
  let g:go_gopls_enabled = 1
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_variable_declarations = 1
  let g:go_highlight_variable_assignments = 1
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_diagnostic_errors = 1
  let g:go_highlight_diagnostic_warnings = 1
  let g:go_auto_sameids = 0

  " ale
  let g:ale_linters = {
        \   'sh': ['shellcheck'],
        \   'go': ['gometalinter', 'gofmt','gobuild'],
        \}
endif
