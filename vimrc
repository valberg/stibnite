" vim: set ft=vim:
"

" Stibnite settings
let g:stibnite_conf_dir = '~/.vim/stibnite/'
let g:stibnite_enabled_plugins = split( system('ls ' . g:stibnite_conf_dir . 'plugins/enabled/'), '\n' )
let g:stibnite_configs = split(system('ls ' . g:stibnite_conf_dir . 'configs/enabled/', '\n'))

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

""" Stibnite Plugins Start

    for plugin in g:stibnite_enabled_plugins
        execute 'source ' . g:stibnite_conf_dir . 'plugins/enabled/' . plugin
    endfor
"""" Stibnite Plugins End

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

""" Stibnite Configs Start
    for config in g:stibnite_configs
        execute 'source ' . g:stibnite_conf_dir . 'configs/enabled/' . config
    endfor
"""" Stibnite Configs End
