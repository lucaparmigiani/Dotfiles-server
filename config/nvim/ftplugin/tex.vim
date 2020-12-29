nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
nnoremap <leader>r :VimtexCompile<CR>
nnoremap <silent> <leader>ep :e /home/luca/Dotfiles/nvim/tex/preamble.tex<CR>
nnoremap <CR> A\\<esc>j

" bold in visual mod
vmap <leader>B di\textbf{}<ESC>P
" or in normal 
nnoremap <leader>B dei\textbf{}<ESC>P

" code in visual mod
vmap <leader>c di\code{}<ESC>P
" or in normal 
nnoremap <leader>c dei\code{}<ESC>P

" math in visual mod
vmap <leader>M di$$<ESC>P
" or in normal 
nnoremap <leader>M dei$$<ESC>P
