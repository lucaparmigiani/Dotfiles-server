" Pandoc, md -> pdf
map <leader>R :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>

" bold in visual mod
vmap <leader>b di****<ESC>hP
" math in visual mod 
vmap <leader>m di$$<ESC>P
" code in visual mod
vmap <leader>cc di``<ESC>P

" code R 
nnoremap <leader>cr 3i`<esc>ar<CR><CR><esc>3i`<esc>ki
nnoremap <leader>cR 3i`<esc>a{r}<CR><CR><esc>3i`<esc>ki

" (MARKDOWN IMAGE PASTE)
" autocmd FileType md 
nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'

" (VIM-MARKDOWN)
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
" set conceallevel=2
let g:vim_markdown_math = 1
let g:vim_markdown_fenced_languages = ['python=py']
"
