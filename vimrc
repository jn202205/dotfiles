".vimrc
set nocompatible
set encoding=utf-8

"""""""""""
" Configs "
"""""""""""

if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on

  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

if &t_Co > 2 || has("gui_running")
  " Enable syntax highlighting
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

set nobackup
set noswapfile
set tabstop=2                       " indent two spaces on tab
set shiftwidth=2                    " 2 spaces for autoindenting
set shiftround                      " always indent to a multiple of shiftwidth
set backspace=2                     " backspace deletes like most programs in insert mode
set autoindent                      " set autoindenting on
set smarttab                        " use smart tabs
set relativenumber                  " use relative line numbering
set number                          " show current line number in vim >=7.4
set numberwidth=3                   " set gutter 3 nums wide
set ruler                           " show cursor position at all times
set showcmd                         " display incomplete commands
set incsearch                       " do incremental searching
set autowrite                       " auto write before running commands
set expandtab                       " use spaces for tabs
set showmatch                       " show matching parentheses
set ignorecase                      " ignorecase when searching
set smartcase                       " override ignore case if search contains uppercase
set hlsearch                        " highlight search terms
set list listchars=tab:»·,trail:·   " show extra spaces
set wildmenu                        " enable bash style tab completion
set wildmode=list:longest,full
set clipboard=unnamed               "use system clipboard
set laststatus=2                    " always display status line
set ttimeoutlen=50
set guitablabel=%t
set lazyredraw                      "buffer screen updates instead of updating all the time

"Open split panes to right and bottom
set splitbelow
set splitright

""""""""""""""""
" Key Mappings "
""""""""""""""""
" map , as leader
let mapleader=","

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" remove trailing whitespace
map <leader>w :%s/\s\+$//g<CR>

"""""""""""
" Plugins "
"""""""""""
" ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"

" syntastic
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_exec = '/Users/jnewm/.rbenv/shims/ruby'
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_error_symbol = "☠"
let g:syntastic_warning_symbol = "⚠"
highlight SyntasticErrorSign ctermbg=240
highlight SyntasticWarningSign ctermbg=240

" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" ctrlp config
nnoremap <silent> <leader>p :CtrlPClearCache<cr>\|:CtrlP<cr>
let g:ctrlp_max_height = 10
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" use netrw like nerdtree
let g:netrw_liststyle=3

"use Dispatch or tslime to run vim-rspec commands
let g:rspec_command = 'Dispatch rspec {spec}'

" javascript-libraries-syntax
let g:used_javascript_libs = 'jquery,angularjs'

"""""""""""""""
" Statusline "
"""""""""""""""
set statusline=%F%m%r%h%w\
set statusline+=%{fugitive#statusline()}\
set statusline+=\ [line\ %l\/%L]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"""""""""""""""
" Color Stuff "
"""""""""""""""
set background=dark
colorscheme base16-railscasts

highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight ColorColumn  ctermbg=237
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=240 ctermfg=12
highlight IncSearch    ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight SpellBad     ctermbg=0   ctermfg=1

highlight GitGutterAdd ctermbg=236
highlight GitGutterChange ctermbg=236
highlight GitGutterDelete ctermbg=236
highlight GitGutterChangeDelete ctermbg=236

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
endif

"""""""""""""""
"   Ctags     "
"""""""""""""""
set tags+=gems.tags
autocmd BufWritePost * exe ":UpdateTags"
