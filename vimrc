" vim: set ft=vim:

filetype off

""" Vundle
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'
    Bundle 'molokai'

""" Stibnite
    let g:stibnite_conf_dir = '~/.vim/stibnite/'

    let g:stibnite_enabled_plugins = split( system('ls ' . g:stibnite_conf_dir . 'plugins/enabled/'), '\n' )

    for plugin in g:stibnite_enabled_plugins
        execute 'source ' . g:stibnite_conf_dir . 'plugins/enabled/' . plugin
    endfor

    let g:stibnite_configs = split(system('ls ' . g:stibnite_conf_dir . 'configs/enabled/', '\n'))

    for config in g:stibnite_configs
        execute 'source ' . g:stibnite_conf_dir . 'configs/enabled/' . config
    endfor

    filetype plugin indent on
