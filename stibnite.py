#!/usr/bin/env python
"""
Usage:
    stibnite.py (list | enable <plugin> | disable <plugin>)

"""
import os
from docopt import docopt

CONFIG_DIR = './configs'

PLUGINS_DIR = './plugins'

PLUGINS_AVAILABLE_DIR = os.path.join(PLUGINS_DIR, 'available')
PLUGINS_ENABLED_DIR = os.path.join(PLUGINS_DIR, 'enabled')

all_plugins = sorted(os.listdir(PLUGINS_AVAILABLE_DIR))
enabled_plugins = sorted(os.listdir(PLUGINS_ENABLED_DIR))
not_enabled_plugins = sorted(list(set(all_plugins) - set(enabled_plugins)))

if __name__ == '__main__':
    args = docopt(__doc__, version='0.1')

    if args['list']:
        print('Enabled plugins:')
        for plugin in enabled_plugins:
            print('- {}'.format(plugin))

        print('')

        print('Not enabled plugins:')
        for plugin in not_enabled_plugins:
            print('- {}'.format(plugin))

    plugin = args['<plugin>']

    if args['enable']:
        os.symlink(
            os.path.join(PLUGINS_AVAILABLE_DIR, plugin),
            os.path.join(PLUGINS_ENABLED_DIR, plugin)
        )
    elif args['disable']:
        if plugin in enabled_plugins:
            os.unlink(os.path.join(PLUGINS_ENABLED_DIR, plugin))
        else:
            print('Plugin {} is not enabled.'.format(plugin))
