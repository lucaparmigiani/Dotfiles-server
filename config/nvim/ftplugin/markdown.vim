" Pandoc, md -> pdf
map <leader>r :execute "!cd %:p:h; pandoc -s ".expand('%:t')." -o ".expand('%:t:r').".pdf"<CR>
nnoremap <CR> A  <esc>j

" bold in visual mod
vmap <leader>B di****<ESC>hP
nmap <leader>B dwi****<ESC>hP
" math in visual mod 
vmap <leader>m di$$<ESC>P
" code in visual mod
vmap <leader>cc di``<ESC>P

" code R 
nnoremap <leader>cr 3i`<esc>ar<CR><CR><esc>3i`<esc>ki
" code Go
nnoremap <leader>cg 3i`<esc>ago<CR><CR><esc>3i`<esc>ki

" (MARKDOWN IMAGE PASTE)
" autocmd FileType md 
nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'

" (VIM-MARKDOWN)
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
set conceallevel=2
let g:vim_markdown_math = 1
let g:vim_markdown_fenced_languages = ['python=py']
