set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'romainl/Apprentice'
Plugin 'prabirshrestha/async.vim'
Plugin 'tpope/vim-commentary'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'brooth/far.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'othree/html5.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'roxma/nvim-yarp'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-abolish'
Plugin 'vim-airline/vim-airline'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'roxma/vim-hug-neovim-rpc'
" Plugin 'prabirshrestha/vim-lsp'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'sheerun/vim-polyglot'
Plugin 'kshenoy/vim-signature'
Plugin 'valloric/youcompleteme'


call vundle#end()            " required
filetype plugin indent on    " required




set nocompatible

set modelines=0


colorscheme apprentice

" highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
" match ExtraWhitespace /\s\+$/
" autocmd Syntax * syn match ExtraWhitespace /\s\+$/ containedin=ALL
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" autocmd BufWinLeave * call clearmatches()
function StripTrailingWhitespace()
  :%s/\s\+$//e
endfunction
autocmd BufWritePre *
  \   if get(b:, 'save_without_trailing_whitespace', 1)
  \ | call StripTrailingWhitespace()
  \ | endif
function SaveWithTrailingWhitespace()
  let b:save_without_trailing_whitespace=0
  :w
  let b:save_without_trailing_whitespace=1
endfunction



set nobackup
set nowritebackup
set directory=~/.vim/.tmp,~/tmp,/tmp

let mapleader=" "

set smartcase
set updatetime=750
set gfn=Monaco:h17
set encoding=utf-8

" set noruler

set number
set relativenumber

set ignorecase
set smartcase
" set incsearch " replaced by plugin

set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
set copyindent
set smarttab
set pastetoggle=<F2>

set nowrap

set colorcolumn=80

set scrolloff=5
set list
set listchars=tab:→\ ,space:·,nbsp:␣,trail:·,extends:»,precedes:«
highlight NonText ctermfg=DarkGray guifg=#4A4A4A
highlight SpecialKey ctermfg=DarkGray guifg=#4A4A4A


set shortmess+=I " hide the launch screen

imap jk <Esc>
" vmap jk <Esc>
" map <D-1> gT
" map <D-2> gt
nmap <D-1> :bp<CR>
nmap <D-2> :bn<CR>
nmap <D-w> :bd<CR>
set hidden

" nmap <D-W> :bd

nmap <leader>r :reg<CR>


set wildmenu
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*

if has("persistent_undo")
    set undodir=$HOME/.vim/.undo
    set undofile
endif

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction
nnoremap <D-b> :call ToggleNetrw()<CR>


if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_mruf_relative = 1
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<cr>'],
    \ }



let g:far#source = 'ag'



let g:indentLine_char = '¦'

let g:signaturemap = {
    \ 'leader'             :  "m",
    \ 'placenextmark'      :  "m,",
    \ 'togglemarkatline'   :  "m.",
    \ 'purgemarksatline'   :  "m-",
    \ 'deletemark'         :  "",
    \ 'purgemarks'         :  "m<space>",
    \ 'purgemarkers'       :  "m<bs>",
    \ 'gotonextlinealpha'  :  "",
    \ 'gotoprevlinealpha'  :  "",
    \ 'gotonextspotalpha'  :  "",
    \ 'gotoprevspotalpha'  :  "",
    \ 'gotonextlinebypos'  :  "",
    \ 'gotoprevlinebypos'  :  "",
    \ 'gotonextspotbypos'  :  "",
    \ 'gotoprevspotbypos'  :  "",
    \ 'gotonextmarker'     :  "`]",
    \ 'gotoprevmarker'     :  "`[",
    \ 'gotonextmarkerany'  :  "",
    \ 'gotoprevmarkerany'  :  "",
    \ 'listbuffermarks'    :  "",
    \ 'listbuffermarkers'  :  ""
    \ }

nnoremap / /\v
vnoremap / /\v

" nnoremap <tab> %
" vnoremap <tab> %

nmap <D-/> gcc
imap <D-/> <Esc>gcci
vmap <D-/> gc

nnoremap <D-p> <Esc>:CtrlPMixed<CR>
nnoremap <C-p> <Esc>:CtrlPBuffer<CR>
nnoremap <D-P> <Esc>:CtrlPMRU<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

imap <D-CR> <Esc>o

" map <C-[> <C-t>

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
" map *  <Plug>(incsearch-nohl-*)
" map #  <Plug>(incsearch-nohl-#)
" map g* <Plug>(incsearch-nohl-g*)
" map g# <Plug>(incsearch-nohl-g#)

nnoremap n n:call PulseCursorLine()<cr>
nnoremap N N:call PulseCursorLine()<cr>

nnoremap <F5> :UndotreeToggle<cr>



let g:airline_section_z=''
" let g:airline_skip_empty_sections = 1








" let g:deoplete#enable_at_startup = 1

" -----------------------------------------
" language servers

" if executable('typescript-language-server')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'typescript-language-server',
"         \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
"         \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
"         \ 'whitelist': ['typescript', 'typescript.tsx'],
"         \ })
" endif

map <Leader>a :LspCodeAction<CR>
map <Leader>d :sp<CR>:LspDefinition<CR>
map <Leader>i :sp<CR>:LspImplementation<CR>
map <Leader>h :LspHover<CR>
" map <F2> :LspRename<CR>

let g:lsp_preview_keep_focus = 0


let g:ycm_language_server =
  \ [
  \   {
  \     'name': 'ruby',
  \     'cmdline': [ expand( '$HOME/.rvm/gems/ruby-2.4.2/bin/solargraph' ), 'stdio' ],
  \     'filetypes': [ 'ruby' ],
  \   },
  \ ]


" ----------------------------------------

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"










" Pulse ------------------------------------------------------------------- {{{

function! PulseCursorLine()
    setlocal cursorline

    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    hi CursorLine guibg=#3a3a3a
    redraw
    sleep 14m

    hi CursorLine guibg=#4a4a4a
    redraw
    sleep 10m

    hi CursorLine guibg=#3a3a3a
    redraw
    sleep 14m

    hi CursorLine guibg=#2a2a2a
    redraw
    sleep 10m

    execute 'hi ' . old_hi
    setlocal nocursorline
endfunction

" }}}

