"       PLUGIN       
"  _________________ 

call plug#begin()

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
" * Syntax
Plug 'joshdick/onedark.vim'
"Plug 'ap/vim-css-color'

" * Navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim' " For closing buffer (dependencies of ranger)
"Plug 'junegunn/fzf.vim'

" * Git
"Plug 'tpope/vim-fugitive'

" * Completition
Plug 'SirVer/ultisnips'
"Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2'

" * R
"Plug 'jalvesaq/Nvim-R'
"Plug 'gaalcaras/ncm-R' " completition for R

" * Slime
"Plug 'jpalardy/vim-slime'

" * Markdown
"Plug 'tpope/vim-markdown'
 
" * highlight
Plug 'kelwin/vim-smali'

"* Rust
"Plug 'rust-lang/rust.vim'

"* Python
"Plug 'broesler/jupyter-vim'
"Plug 'ivanov/vim-ipython'

" * Go
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

" * Matlab
"Plug 'daeyun/vim-matlab', { 'do': function('DoRemote') }
"--------------------------------------------------------------------------------

call plug#end()

"      GENERAL      
" _________________ 

"set relativenumber
let mapleader=" "
let maplocalleader="\\"
set nocompatible
filetype plugin on
syntax on
nnoremap <silent><esc> :noh<return><esc> " for clear last search highligth
set ignorecase
" Make sense of vim split vertical bar
highlight VertSplit guibg=Orange guifg=Black ctermbg=6 ctermfg=0
set nofoldenable    " disable folding

" Searching
set nowrapscan "whene you reach the bottom while searching, don't go top

" (Terminal)
" Open a new terminal in the directory
"nnoremap <silent> <leader>t :!gnome-terminal --working-directory='%:h'<CR>
"nnoremap <leader>t :!termite h% &<CR><esc>

" (Color)
"autocmd ColorScheme janah highlight Normal ctermbg=235
colorscheme onedark
let base16colorspace=256
"if filereadable(expand("~/.vimrc_background"))
"  let base16colorspace=256
"  source ~/.vimrc_background endif

" (Indenting)
set tabstop=4        " show existing tab with 4 spaces width
set shiftwidth=4     " when indenting with '>', use 4 spaces width
set expandtab        " On pressing tab, insert 4 spaces
" Make > < easier keeping text selected
vmap > >gv
vmap < <gv
nmap <Tab> v><esc>
nmap <s-Tab> v<<esc>
vnoremap <Tab> >gv
vnoremap <s-Tab> <gv

" (Mouse)
set mouse=a 

" (Save and Exit)
noremap <silent> <leader>q :update<CR>
noremap <silent> <leader><BS> :q!<CR>
inoremap <C-Space> <Esc>

" (Buffer)
map <silent> <leader>bn :bn<CR>
map <silent> <leader>bp :bp<CR>
map <silent> <leader>bc :Bclose<CR>

" (Order)
command!  -range=% -nargs=? GenNum <line1>,<line2>call s:Prepend(<args>)

function! s:ReplExpr(nb_digits, number)
  return repeat('0', a:nb_digits - strlen(a:number)).a:number
endfunction

function! s:Prepend(...) range
  let pattern = a:0 > 0 ? '\ze'. a:1 : '^'
  let nb_values = (a:lastline - a:firstline) + 1
  let nb_digits = strlen(nb_values)
  exe ':'.a:firstline.','a:lastline.'s#'.pattern.'#\=s:ReplExpr(nb_digits, 1+ line(".")-'.a:firstline.')."."#'
endfunction

" (Substitute)
" last search <c-r>/
nnoremap <leader>sl :%s/<c-r>///g<LEFT><LEFT>
nnoremap <leader>sa :%s//g<LEFT><LEFT>

"       MOVE        
" _________________ 

" go up/down by screen lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" End line
map ml $
" Start line
map mh 0
" Center
map <silent> mm :call cursor(0, len(getline('.'))/2)<CR>

" Move/Delete in insert mode 
"inoremap <A-k> <C-o>gk
"inoremap <A-h> <C-o>h
"inoremap <A-l> <C-o>l
"inoremap <A-j> <C-o>gj
inoremap <A-Del> <C-o>dw
inoremap <A-BS> <C-w>
" I try to jump each space
"nnoremap <A-h> F h
"nnoremap <A-l> f l
" copy like a normal person
vnoremap <c-c> "+y
""inoremap <c-s-v> <c-r>*
"inoremap <c-v> <esc>"*pa
"set clipboard=unnamed
"function! ClipboardYank()
"  y
"  call system('xclip -selection clipboard', @@)
"endfunction
"function! ClipboardPaste()
"  let @@ = system('xclip -o -selection clipboard')
"endfunction
"vnoremap <C-c> :call ClipboardYank()<cr>

" go up/down by one line
nnoremap <a-e> <c-e>
nnoremap <a-y> <c-y>

" vim smooth scroll 
let timeSmooth = 30
"noremap <silent> <A-b> :call smooth_scroll#up(&scroll*10, timeSmooth, 50)<CR>
"noremap <silent> <A-f> :call smooth_scroll#down(&scroll*10, timeSmooth, 50)<CR>
noremap <silent> <A-k> :call smooth_scroll#up(&scroll, timeSmooth, 4)<CR>
noremap <silent> <A-j> :call smooth_scroll#down(&scroll, timeSmooth, 4)<CR>

" (Navigation in Tmux) 
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

"       THEME        
" _________________ 

" Airline
"let g:airline_theme='deus'
"silent! call airline#extensions#whitespace#disable()

" Transparecy 
highlight Normal ctermbg=none
highlight NonText ctermbg=none

"       FILE        
" _________________ 

" (init.vim) ec
nnoremap <silent> <leader>ec :e ~/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>sc :source ~/.config/nvim/init.vim<CR>

" (zshrc) ez
" zsh
nnoremap <silent> <leader>ez :e ~/.zshrc<CR>
nnoremap <silent> <leader>sz :!source ~/.zshrc<CR>

" (tmux.conf) et
nnoremap <silent> <leader>et :e ~/.tmux.conf<CR>

" (Nvim-R)
" open the wiki 
nnoremap <silent> <leader>er :e ~/.config/nvim/plugged/Nvim-R/doc/Nvim-R.txt<CR>
let g:rout_follow_colorscheme = 1
let g:Rout_more_colors = 1
let g:R_assign = 2

" (Ranger)
let g:ranger_command_override = 'ranger -cd'
let g:ranger_map_keys = 0
noremap <leader>ff :Ranger<CR>
noremap <leader>fv <C-w>v:Ranger<CR>
let g:ranger_replace_netrw = 1

nnoremap <silent> <leader>do :e ~/Dotfiles<CR>

" (Fzf)
set rtp+=~/.fzf
" https://github.com/junegunn/fzf/wiki/Examples-(vim)
map <silent> <Leader>p :Files <C-R>=expand('%:h')<CR><CR>
map <Leader>P :Files 
map <silent> <leader>bb :Buffers<CR>
" map <silent> <leader>o :call fzf#run({'source': 'cat ~/.config/', 'sink': 'e'})
" map <silent> <leader>o :call fzf#run({'source': 'call UltiSnips#ListSnippets()', 'sink': 'e'})

" (Ncm-R)
   autocmd BufEnter * call ncm2#enable_for_buffer()
" inoremap <c-z> :call ncm2#enable_for_buffer()<cr>
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c
" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
"inoremap <c-c> <ESC>
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" Use <TAB> to select the popup menu:
inoremap <expr> <A-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <A-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"--------------------------------------------------------------------------------
"    Status bar
" _________________ 
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
        set nonumber
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
        set number
    endif
endfunction

let s:hidden_all = 1
set noshowmode
set noruler
set laststatus=0
set noshowcmd

nnoremap <silent> ò :call ToggleHiddenAll()<CR>

" (Vimtex)
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
se conceallevel=0
"set conceallevel=2
"let g:tex_conceal="sabgm"
let g:tex_conceal='abdmg'
let g:vimtex_compiler_progname='nvr'
let g:vimtex_compiler_latexmk = {
      \ 'options' : [
      \   '-pdf',
      \   '-shell-escape',
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ]}
" Gilles Castel inkscape
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
"
" (Ultisnips)
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
nnoremap <silent> <leader>es :UltiSnipsEdit<CR>

" (Slime)
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
"  if !hasmapto('<Plug>SlimeRegionSend', 'x')
"      xmap <Bslash>d <Plug>SlimeRegionSend
"    "xmap \d <Plug>SlimeRegionSend
"  endif
"  if !hasmapto('<Plug>SlimeLineSend', 'x')
"      nmap <Bslash>d <Plug>SlimeLineSend
"    "xmap \d <Plug>SlimeRegionSend
"  endif


" PYTHON
"pythonx import sys; 
"
let g:vim_virtualenv_path = '/home/luca/Lib/Python/py27'
if exists('g:vim_virtualenv_path')
    pythonx import os; import vim
    pythonx activate_this = os.path.join(vim.eval('g:vim_virtualenv_path'), 'bin/activate_this.py')
    pythonx with open(activate_this) as f: exec(f.read(), {'__file__': activate_this})
endif
"print(sys.version)
" I don't use FTP for python because sometimes I want to write script
" without extestion .py
nnoremap <leader>r :exec '!python3' shellescape(@%, 1)<cr>
nnoremap <leader>R :!termite h% --exec="/bin/bash -i -c 'python3 %'" --hold &<CR><esc>

" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
"--------------------------------------------------------------------------------
"        FTP        
" _________________ 
" For applying textwidth use
" Set textwidth to 80 (:set textwidth=80), move to the start of the file and type gqG

" (C++)
augroup Cpp 
    autocmd BufReadPre,FileReadPre *.cpp set ft=cpp
augroup END
" (C)
augroup Cpp 
    autocmd BufReadPre,FileReadPre *.c set ft=c
augroup END
" (cuda)
augroup cuda 
    autocmd BufReadPre,FileReadPre *.cu,.*cuh set ft=cuda
augroup END
" (Markdown)
augroup Markdown 
    autocmd BufReadPre,FileReadPre *.md set ft=markdown textwidth=80
augroup END
" (RMarkdown)
augroup Rmarkdown 
    autocmd BufReadPre,FileReadPre *.Rmd set ft=Rmd
augroup END
" (Latex)
augroup Tex 
    autocmd BufReadPre,FileReadPre *.tex,*.bib set ft=latex textwidth=80
augroup END
" (Rust)
augroup Rust 
    autocmd BufReadPre,FileReadPre *.rs set ft=rs
augroup END
" (Golang)
augroup Go 
    autocmd BufReadPre,FileReadPre *.go set ft=go
augroup END
" (Matlab)
augroup Matlab 
    autocmd BufReadPre,FileReadPre *.m set ft=m
augroup END
" (R)
augroup R 
    autocmd BufReadPre,FileReadPre *.R set ft=R
augroup END
" (Dot)
augroup R 
    autocmd BufReadPre,FileReadPre *.dot set ft=dot
augroup END

"--------------------------------------------------------------------------------
"   GENERAL EDIT         
" _________________

" Add separetor ------
nnoremap <leader>- 80a-<esc>
nnoremap <leader>à :set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<<CR>:set list<CR>
