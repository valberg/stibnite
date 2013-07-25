""" Vundle
    filetype off

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'
    Bundle 'molokai'

    let g:stibnite_conf_dir = '~/.vim/stibnite/'

    let g:stibnite_enabled_plugins = split( system('ls ' . g:stibnite_conf_dir . 'plugins/enabled/'), '\n')

    for plugin in g:stibnite_enabled_plugins
        execute 'source ' . g:stibnite_conf_dir . 'plugins/enabled/' . plugin
    endfor

    execute 'source ' . g:stibnite_conf_dir . 'general'
    execute 'source ' . g:stibnite_conf_dir . 'mappings'

    filetype plugin indent on



""" Open split window with ,w
    nnoremap <leader>w <C-w>v<C-w>l


""" Run things within vim with 'enter'
    map <C-M> :make<CR>'


""" LaTeX
    autocmd FileType tex setlocal fileencoding=utf-8
    autocmd FileType tex setlocal makeprg=pdflatex\ '%'
    autocmd FileType tex setlocal spell
    autocmd FileType tex setlocal spelllang=da
    " make sure vim-latex is loaded if the file is an empty .tex
    let g:tex_flavor='latex'

""" Tags
    " Using <C-_> is a bit easier on the hands
    nnoremap <C-_> <C-]>

""" GVIM
set guioptions-=r
set guioptions-=l
set guioptions-=L
set guioptions-=R
set guifont=DejaVu\ Sans\ Mono\ 9
set guioptions-=T
set guioptions-=m
set guioptions+=a
