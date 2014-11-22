# Stibnite

Stibnite is a way to structure a VIM configuration using multiple files. The
idea is that instead of dividing a big .vimrc file into sections, each such
section is its own file.

Mainly there are two types of configuration files:

- configs/

    These are general configuration files. Stuff like mappings and language
    specific configuration goes here.

- plugins/

    These are per-plugin configurations. Each plugin configuration file also
    acts as a way to tell Vundle that a plugin shall be installed and enabled.

    - plugins/available/ contains all plugins available
    - plugins/enabled/ contains symlinks to the available plugins that should
      be enabled


## Installation

1. Install NeoBundle:

    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

2. Get Stibnite:

    git clone http://github.com/valberg/stibnite.git ~/.vim/stibnite

3. Setup .vimrc link

    ln -s ~/.vim/stibnite/vimrc ~/.vimrc
