source $VIMRUNTIME/defaults.vim
syntax on
set mouse-=a
set ignorecase
set hlsearch


" Basic cursor movement and deletion keybindings from emacs, for vim.

" insert mode
vmap <C-b> <Left>
vmap <C-f> <Right>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <C-o>:call <SID>home()<CR>
imap <C-e> <End>
vmap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>
imap <C-k> <C-r>=<SID>kill_line()<CR>
imap <C-p> <Up>
imap <C-n> <Down>

" command line mode
nmap <C-b> <Left>
nmap <C-f> <Right>
cmap <C-p> <Up>
cmap <C-n> <Down>
cmap <C-b> <Left>
cmap <C-f> <Right>
nmap <C-a> <Home>
cmap <C-e> <End>
cmap <C-a> <Home>
cmap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-k> <C-f>D<C-c><C-c>:<Up>

function! s:home()
  let start_col = col('.')
  normal! ^
  if col('.') == start_col
    normal! 0
  endif
  return ''
endfunction

function! s:kill_line()
  let [text_before_cursor, text_after_cursor] = s:split_line_text_at_cursor()
  if len(text_after_cursor) == 0
    normal! J
  else
    call setline(line('.'), text_before_cursor)
  endif
  return ''
endfunction

function! s:split_line_text_at_cursor()
  let line_text = getline(line('.'))
  let text_after_cursor  = line_text[col('.')-1 :]
  let text_before_cursor = (col('.') > 1) ? line_text[: col('.')-2] : ''
  return [text_before_cursor, text_after_cursor]
endfunction
