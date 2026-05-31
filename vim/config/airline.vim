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
