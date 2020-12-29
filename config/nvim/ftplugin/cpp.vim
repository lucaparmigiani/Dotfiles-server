function Compilecpp()
    exec '!g++ '.shellescape('%').' -o '.shellescape('%:r')<CR>
    exec './'.shellescape('%:r')<CR>
    return 1
endfunction

map <leader>B :make %<<CR> 
"nnoremap <leader>R :!termite h% --exec="/bin/bash -i -c './%<'" --hold &<CR><esc>
nnoremap <leader>R :call Compilecpp()<CR>
