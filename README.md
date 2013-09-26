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

1. Install Vundle:

    git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

2. Get Stibnite:

    git clone http://github.com/valberg/stibnite.git ~/.vim/stibnite

3. Setup .vimrc link

    ln -s ~/.vim/stibnite/vimrc ~/.vimrc


## Enable/disable plugins

There are two ways to enable/disable a plugin:

### Using VIM

Totally in development, but it is possible right now to list, enable and
disable plugins.

To show the list run :StibniteList

Usage information should be shown in the top of the list.

### Using the included python script

For commandline use there is a python script, `stibnite.py`. the usage is as
follows:

One can list plugins as such:

    ./stibnite.py list

Enable plugins as such:

    ./stibnite.py enable <name-of-plugin>

Or disable as such:

    ./stibnite.py disable <name-of-plugin>

This script is currently only tested on Python 2.7.4, and requires the
`docopt` module. For convenience I've included the `docopt.py` module in here.
Check out http://docopt.org/ to learn more about this awesome library!
