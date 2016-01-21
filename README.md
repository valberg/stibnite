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

1. Get Stibnite:

    git clone http://github.com/valberg/stibnite.git ~/.vim/stibnite

2. Setup .vimrc link

    ln -s ~/.vim/stibnite/vimrc ~/.vimrc

3. (Optional): Symlink plugins from ~/.vim/stibnite/plugins/available to
   ~/.vim/stibnite/plugins/enabled/ to enable those plugins.

4. Fire up vim and plugins should be automatically installed.
