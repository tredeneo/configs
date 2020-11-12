"######## ".config/nvim"
"cursor:normal-inserir-visual-comando=linha verical,substituir=linha horizontal
set guicursor=n-i-v-c:ver100-blinkon1,r:hor100-blinkon0

"#############################################################################
"mudar blocos coloridos de erro para caractere sublinhado de erro
hi spellBad cterm=underline ctermbg=NONE
hi SpellCap cterm=underline ctermbg=NONE
"verifica o grupo de erro
map <F10> :echo synIDattr(synID(line("."), col("."), 1), "name")

"#############################################################################
"cortar,copiar e colar
vmap <C-c> "+y
vmap <C-x> "+x
vmap <C-v> "+gP
"#############################################################################
"cancelar selecionados
nnoremap <ESC> :nohlsearch<CR> 

imap <C-l> <Right>

"#############################################################################
"mover linhas com para cima para baixo
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap <A-j> :m '>+1<CR>gv=gv

"#############################################################################
"esconder mensagens de atenção
set shortmess+=A

"#############################################################################
"cor da janela flutuante
highlight Pmenu ctermbg=8
highlight PmenuSel ctermbg=7

"#############################################################################
"gerenciador de plugin
call plug#begin()

"#############################################################################

"############################################################################# 
"fechar automaticamente chaves,aspas ...
Plug 'jiangmiao/auto-pairs' 

"#############################################################################
"############################################################################# 
"verificação de sintaxe
Plug 'dense-analysis/ale'
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\	'go': ['gofmt','remove_trailing_lines','trim_whitespace'],
\	'c': ['clang-format','remove_trailing_lines','trim_whitespace'],
\}
let g:ale_c_clangformat_options = '-style=webkit'


"#############################################################################  
"navegador de arquivos
Plug 'scrooloose/nerdTree'
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1


"#############################################################################  
"parenteses coloridos
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

"#############################################################################

"#############################################################################
"colocar barra de status
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='dark'
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#ale#enabled = 1

"mostra as guias abertas
let g:airline#extensions#tabline#enabled = 1
nmap <S-Tab> :w \|bn<CR>


"#############################################################################
"auto-complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
\   'coc-clangd',"coc-python",'coc-snippets','coc-flutter']
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<s-Tab>'
"atribui <c-espaço> para completar, alguns terminais da <NUL>
"inoremap <silent><expr> <c-x> coc#refresh()
Plug 'honza/vim-snippets'
"Plug 'SirVer/ultisnips'


" <TAB>: completion.
"inoremap <expr><C-x> pumvisible() ? "\<Tab>" : "\<C-x>"
inoremap <expr><C-j>  pumvisible() ? "\<Down>" : "\<C-j>"
inoremap <expr><C-k> pumvisible() ? "\<Up>" : "\<C-k>"

"#############################################################################
"realce de sintaxe
Plug 'sheerun/vim-polyglot'

"#############################################################################
Plug 'skywind3000/asyncrun.vim'
nnoremap <F5> :call <SID>compile_and_run()<CR>
nnoremap <F6> :call <SID>makefile()<CR>
nnoremap <F7> :call <SID>termminal()<CR>

function! s:compile_and_run()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! clang -std=c99 % -o %<;./%<"
    elseif &filetype == 'python'
        exec "AsyncRun! python3 %"
    elseif &filetype == 'go'
        exec "AsyncRun!  go run %"
    elseif &filetype == 'cpp'
       exec "AsyncRun! clang++ -std=c++17 % -o %<;./%<"
    elseif &filetype == 'java'
       exec "AsyncRun! javac %;java %<"
    elseif &filetype == 'kotlin'
        exec "AsyncRun! kotlin % -include-runtime -d %<.jar;java -jar %<.jar"
    elseif &filetype == 'sh'
       exec "AsyncRun! bash %"
    endif
endfunction

function! s:makefile()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! make -C %:p:h;time make rodar -C %:p:h"
    elseif &filetype == 'dart'
        :CocCommand flutter.run -d chrome
    endif
endfunction

function! s:termminal()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! mode=term -pos=right make -C %:p:h;make rodar -C %:p:h"
    elseif &filetype == 'python'
        exec "AsyncRun! -mode=term -pos=right python3 %"
    elseif &filetype == 'go'
        exec "AsyncRun! -mode=term -pos=right go run %"
    endif
endfunction
    
let g:asyncrun_open = 15
    
"#############################################################################
"mostrar indendação
Plug 'nathanaelkane/vim-indent-guides'
set ts=4 sw=4 et
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=4
let g:indent_guides_enable_on_vim_startup = 1

"#############################################################################
"colocar numero nas linhas
Plug 'jeffkreeftmeijer/vim-numbertoggle'
"colocar numeros de linhas relativo
set number relativenumber

"#############################################################################
call plug#end()
