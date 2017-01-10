"=====================================
" Mi configuración Vim
" Author: Felix Molero
" Email: <elhaclelibre@gmail.com>
" Últimos cambios: 27 - 10 -2016
"====================================
"::::::::::::::::::::::::::::::::::::
" Plugin instalados:
" - Vundle
"   - jedi-vim
"   - pydiction
"   - vim-airline
"   - vim-airline-theme
" - Pathogen
":::::::::::::::::::::::::::::::::::::

syntax          on 
filetype        off                 " Deshabilitar reconocer del tipo de archivo
filetype        plugin on           " Habilitar el detectar el tipo de archivo
filetype        indent on

set             ai                  " Permitir la indentación
set             nu                  " Mostrar el número de la linea de código
set             nocompatible        " Permite funciones no compatibles con Vim
set             autoindent          " Permite la auto indentación
set             autoread            " Se pone en auto leer cuando un archivo se cambia desde el exterior
set             ruler               " Reconoce la fila y columna en la barra de estado
set             mouse=a             " Activa es uso del mouse en Vim
set             tabstop=8           " Establece 8 espacio, (Haskell)
set             softtabstop=4       " Insertar 4 espacio con tab (Haskell)
set             expandtab           " Expande el tabulador dentro del espacio
set             ts=4                " Establece 4 espacio con el tabulador
set             shiftwidth=4        " Establece 4 espacio en la auto indentación
set             shiftround          " Guión y vuelta a múltiples shiftwidth más cercana
set             textwidth=79        " Habilitar ancho del margen del texto
set             cursorline          " Muestra una linea bajo la linea de código
set             showmatch           " Mostrar parte coincidente del para de () [] {}
set             cindent             " Permite la indentación de lenguaje en C
set             spell               " Habilitar el corrector ortográfico
set             spelllang=en,es     " Habilitar el corrector ortográfico en Ingles y Español
set             laststatus=2        " Mostrar status de Airline plugin al iniciar Vim
set             clipboard=unnamed   " Habilitar porta papeles externo
set             encoding=utf-8      " Codificación UTF-8 para Python
set             fileformat=unix     " Habilitar el formato de archivos para Unix 
set             hlsearch            " Habilitar resaltado de búsqueda
set             confirm             " Mostrar un mensaje de dialogo si los cambios no han sido guardados
set             cmdheight=2         " Establecer la altura de la sección de comandos a 2 líneas.
                                    " Es útil si se muestran los avisos (como syntastic) en las líneas de comando
set             colorcolumn=80      " Establecer una línea vertical para el ancho de línea larga.
                                    " casos en los que la longitud de línea se está acercando a 80 caracteres

set             t_Co=256            " Habilitar esquema de 256 colores
set             background=light    " color oscuro
colorscheme     PaperColor          "gotham Tema para Vim
let g:lightline = { 'colorscheme': 'PaperColor' }
let g:PaperColor_Light_Override = { 'background' : '#abcdef', 'cursorline' : '#dfdfff', 'matchparen' : '#d6d6d6' , 'comment' : '#8e908c' }

"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE

"colorscheme space-vim-dark
"highlight Normal ctermfg=grey ctermbg=black

                                    " Plugin Vundle
"======================================
set rtp+=~/.vim/bundle/Vundle.vim
"======================================

" Ejecutar Plugin Pathogen
execute pathogen#infect()

call pathogen#infect()
call pathogen#helptags()

call vundle#begin()
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'wikitopian/hardmode'
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-sensible'
Plugin 'whatyouhide/vim-gotham'
Plugin 'Yggdroot/indentLine'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'NLKNguyen/papercolor-theme'
call vundle#end()

" Check de sintaxis 
let g:syntastic_always_populate_loc_list=1

" Habilitar toda las características de resaltado de sintaxis en Python
let python_highlight_all = 1

" Habilitar PEP8 python
let g:python_pep8_indent_multiline_string = -1

" Habilitar plugin Pydiction (auto completado)
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 3

" Habilitar plugin Airline
let g:airline#extensions#tabline#enabled = 1 
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'

" Habilitar TagList
let Tlist_Compact_Format = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1

" Vim
let g:indentLine_color_term = 239
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
let g:indentLine_char = ':'

" Atajo de teclado navegación modo split
"=====================================
" Ctrl-j mueve hacia bajo el split
 nnoremap <C-J> <C-W><C-J> 
" Ctrl-k mueve hacia arriba el split
 nnoremap <C-K> <C-W><C-K>
" Ctrl-l mueve hacia la derecha el split
 nnoremap <C-L> <C-W><C-L>
" Ctrl-h mueve hacia la izquierda el split
 nnoremap <C-H> <C-W><C-H>
"=======================================

" Auto completado para lenguaje Python
"autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" Auto completado para lenguaje Java
autocmd Filetype javascript set omnifunc=Javascriptcomplete#CompleteJS

" Auto completado para HTML
autocmd Filetype html set omnifunc=htmlcomplete#CompleteTags

" Auto completado CSS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Auto completado PHP
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Auto completado lenguaje C
autocmd FileType c set omnifunc=ccomplete#Complete
"=======================================

" Guardar cursor en la ultima posición
augroup resCur
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" Buscador de ficheros NerdTree
map <F2> :NERDTreeToggle<CR>

"Inserta uptime cada vez que se presiona F2
map! <F2> <ESC>:r !uptime<CR>

" Buscador de etiquetas
map <F3> :TlistToggle<CR>

" Compilar y ejecutar programas en lenguaje C
map <F4> :w <CR>:!gcc % -o %< && ,/%< <CR>

" Ejecutar programas en lenguaje Python
map <F5> :w <CR>:!python %<CR>

" Corrector ortográfico español, ingles
nmap :setlocal spell spelllang=es_es<cr>
nmap :setlocal spell spelllang=en_en<cr>

" Recargar NERDTree / + r
nmap <Leader>r :NERDTreeFocus<cr> \| R \| <c-w><c-p>

" Bash
"let g:BASH_AuthorName   = 'Felix Molero'
"let g:BASH_Email        = 'elhackerlibre@gmail.com'
"let g:BASH_Company      = 'Open Source Corporation'

" Plantilla
let g:license = "GPLv3+"
let g:email = "elhackerlibre@gmail.com"
let g:username = "Felix Molero"


if has("autocmd")
    augroup bashalias
        autocmd BufRead,BufNewFile .bash_aliases set filetype=bash
    augroup END
endif
