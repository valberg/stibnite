" vim: set ft=vim:

" Stibnite settings
let g:stibnite_conf_dir = '~/.vim/stibnite/'
let g:stibnite_enabled_plugins = split( system('ls ' . g:stibnite_conf_dir . 'plugins/enabled/'), '\n' )
let g:stibnite_configs = split(system('ls ' . g:stibnite_conf_dir . 'configs/enabled/', '\n'))

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

set nocompatible

function! LoadStibNitePlugins()
  call plug#begin('~/.vim/plugged')

  """ Stibnite Plugins
  for plugin in g:stibnite_enabled_plugins
    execute 'source ' . g:stibnite_conf_dir . 'plugins/enabled/' . plugin
  endfor

  call plug#end()
endfunction

function! LoadStibNiteConfigs()
    """ Stibnite Configs
    for config in g:stibnite_configs
      execute 'source ' . g:stibnite_conf_dir . 'configs/enabled/' . config
    endfor
endfunction

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC | close
  call LoadStibNitePlugins()
else
  call LoadStibNitePlugins()
  call LoadStibNiteConfigs()
endif


filetype plugin indent on

