"""jupyter-vim
"" Standard keymaps, called from each ftplugin so that we only map the keys
"" buffer-local for select filetypes.
"nnoremap <buffer> <silent> <localleader>r       :JupyterRunFile<CR>
"
"" Change to directory of current file
"nnoremap <buffer> <silent> <localleader>p       :JupyterCd %:p:h<CR>
"
"" Send just the current line
"nnoremap <buffer> <silent> <localleader>e       :JupyterSendCell<CR>
"nnoremap <buffer> <silent> <localleader>d       :JupyterSendRange<CR>j:<C-u>call search('^.\+')<CR>
"nmap     <buffer> <silent> <localleader>l       <Plug>JupyterRunTextObj
"vmap     <buffer> <silent> <localleader>L       <Plug>JupyterRunVisual
"
"nnoremap <buffer> <silent> <localleader>U       :JupyterUpdateShell<CR>
