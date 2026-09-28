" Startify
let g:startify_custom_header = []
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ ]

" Save only what's on screen; hidden buffers otherwise accumulate forever
set sessionoptions-=buffers
set sessionoptions-=blank
set sessionoptions-=terminal
