let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
"unmap <C-c><C-c>
let g:slime_dont_ask_default = 1
nmap \p <Plug>SlimeParagraphSend<cr>j
noremap \l :SlimeSendCurrentLine<cr>
noremap \d :SlimeSendCurrentLine<cr>j
