" Rust
nnoremap <leader>r :!termite h% --exec="/bin/bash -i -c 'rustc %; ./%:r'" --hold &<CR><esc>
nnoremap <leader>R :!termite h% --exec="/bin/bash -i -c 'cargo build; cargo run'" --hold &<CR><esc>
nnoremap <leader>W :!termite h% --exec="/bin/bash -i -c 'cargo check'" --hold &<CR><esc>
nnoremap <leader>E :!termite h% --exec="/bin/bash -i -c 'cargo check'" --hold &<CR><esc>

