" Set vim airline to clean dividers
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.colnr = ' '

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_highlighting_cache = 1

" Disable unnecessary vim airline extensions
let g:airline#extensions#branch#enabled = 0

function! GetTitle()
    return matchstr(join(getline(1, 5), "\n"), 'title\: \zs[^\n]*\ze')
endfunction
call airline#parts#define_function('title', 'GetTitle')

" Cleanup vim airline sections and layout
let g:airline_section_a = airline#section#create(['crypt', 'paste', 'iminsert'])
let g:airline_section_b = airline#section#create(['title'])
"let g:airline_section_c_only_filename = 1
"let g:airline_stl_path_style = 'short'
let g:airline_section_x = airline#section#create_right([])
let g:airline_section_y = airline#section#create_right([])

let g:airline_extensions = [
  \ 'ctrlp',
  \ 'fugitiveline',
  \ 'quickfix',
  \ 'tabline',
  \ 'term',
  \ 'windowswap',
  \ 'nvimlsp',
  \ ]

let airline#extensions#nvimlsp#show_line_numbers = 0

let g:airline#extensions#default#section_truncate_width = {}

" Use Airline tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#fnamemod = ':t'

" Name tabs whose buffer name ends in a slash (Dirvish directories, the Fugitive
" status buffer). Both taboo's %f and airline's fnamemod take the path tail,
" which is empty for those, and airline drops a tab entirely when its title is
" empty. Returning '' defers to airline's own naming.
function! AirlineTabTitle(n) abort
    " Pick the buffer airline's own fallback would name: the first listed
    " buffer in the tab, not the active window's.
    let buflist = tabpagebuflist(a:n)
    let all = airline#extensions#tabline#buflist#list()
    let listed = filter(copy(buflist), 'index(all, v:val) != -1')
    let name = bufname(empty(listed) ? buflist[0] : listed[0])
    if name !~# '[\\/]$'
        return ''
    endif
    if name =~# '^fugitive://'
        return fnamemodify(matchstr(name, '^fugitive://\zs.\{-}\ze/\.git'), ':t') . ' [git]'
    endif
    return fnamemodify(name, ':h:t') . '/'
endfunction
let g:airline#extensions#tabline#tabtitle_formatter = 'AirlineTabTitle'

let g:airline#extensions#hunks#non_zero_only = 1

" Airline theme improvements
let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
    if g:airline_theme == 'jellybeans'
        let a:palette.inactive['airline_c'][3] = '236'
        let a:palette.normal['airline_c'][2] = 'White'
        let a:palette.normal['airline_c'][3] = '236'
        let a:palette.visual['airline_c'][2] = 'White'
        let a:palette.visual['airline_c'][3] = '236'
        let a:palette.insert['airline_c'][2] = 'White'
        let a:palette.insert['airline_c'][3] = '236'
        let a:palette.replace['airline_c'][2] = 'White'
        let a:palette.replace['airline_c'][3] = '236'
        let g:testoutput = keys(a:palette)
    endif
endfunction
