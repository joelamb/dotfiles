vim.cmd [[
  function! SetTerminalTitle()
      let titleString = expand('%:~')
      if len(titleString) > 0
          let &titlestring = expand('%:~')
          " this is the format iTerm2 expects when setting the window title
          let args = "\033];".&titlestring."\007"
          let cmd = 'silent !echo -e "'.args.'"'
          execute cmd
          redraw!
      endif
  endfunction

 augroup _title
   autocmd!
   autocmd BufEnter * call SetTerminalTitle()
 augroup end

 augroup _tabline
  autocmd!
  autocmd InsertEnter * hi TabLineFill guibg=sandybrown
  autocmd InsertLeave * hi TabLineFill guibg=black
augroup end
]]
