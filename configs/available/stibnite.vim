" vim: set ft=vim

command! StibniteList python show_list()

python << EOF
import vim
import os

WIN_SIZE = 50

HOME_DIR = os.path.expanduser('~')
CONFIG_DIR = os.path.join(HOME_DIR, '.vim/stibnite/configs')
PLUGIN_DIR = os.path.join(HOME_DIR, '.vim/stibnite/plugins')

PLUGINS_AVAILABLE_DIR = os.path.join(PLUGIN_DIR, 'available')
PLUGINS_ENABLED_DIR = os.path.join(PLUGIN_DIR, 'enabled')

def refresh_plugin_lists():
    all_plugins = sorted(os.listdir(PLUGINS_AVAILABLE_DIR))
    enabled_plugins = sorted(os.listdir(PLUGINS_ENABLED_DIR))
    disabled_plugins = sorted(list(set(all_plugins) - set(enabled_plugins)))

    return (all_plugins, enabled_plugins, disabled_plugins)

def show_list():
    all_plugins, enabled_plugins, disabled_plugins = refresh_plugin_lists()

    vim.command('pedit [Stibnite]')
    vim.command('wincmd P')
    vim.command('wincmd H')

    window = vim.windows[0]
    window.width = WIN_SIZE

    window.buffer[0:0] = ['=- Stibnite']

    window.buffer.append(' Usage:')
    window.buffer.append('   e - enable plugin')
    window.buffer.append('   d - disable plugin')
    window.buffer.append('')

    window.buffer.append(' Enabled plugins')
    for plugin in enabled_plugins:
        window.buffer.append(' - {}'.format(plugin))

    window.buffer.append('')
    window.buffer.append(' Disabled plugins')

    for plugin in disabled_plugins:
        window.buffer.append(' - {}'.format(plugin))


    # Ensure that the new buffer is not writable
    vim.command('setl buftype=nofile')
    vim.command('setl bufhidden=wipe')
    vim.command('setl noswapfile')
    vim.command('setl nobuflisted')
    vim.command('setl cul')
    vim.command('setl nonu ro noma ignorecase')
    vim.command('if (exists("&relativenumber")) | setl norelativenumber | endif')

    vim.command(
        'nnoremap <buffer> e :python enable_plugin()<CR>'
    )

    vim.command(
        'nnoremap <buffer> d :python disable_plugin()<CR>'
    )

def enable_plugin():
    all_plugins, enabled_plugins, disabled_plugins = refresh_plugin_lists()
    plugin = vim.current.line.replace(' - ', '')

    if plugin not in all_plugins:
        print 'Error! Plugin not found!'

    if plugin in enabled_plugins:
        print 'Plugin already enabled!'

    if plugin in disabled_plugins:
        os.symlink(
            os.path.join(PLUGINS_AVAILABLE_DIR, plugin),
            os.path.join(PLUGINS_ENABLED_DIR, plugin)
        )

        vim.command('source ~/.vimrc')
        redraw_list()

        print 'Plugin {} enabled. You have to restart to source the plugin'.format(plugin)


def disable_plugin():
    all_plugins, enabled_plugins, disabled_plugins = refresh_plugin_lists()
    plugin = vim.current.line.replace(' - ', '')

    if plugin not in all_plugins:
        print 'Error! Plugin not found!'

    if plugin in disabled_plugins:
        print 'Plugin already disabled!'

    if plugin in enabled_plugins:
        os.unlink(os.path.join(PLUGINS_ENABLED_DIR, plugin))

        redraw_list()

        print 'Plugin {} disabled. You have to restart to unsource the plugin'.format(plugin)


def redraw_list():
    vim.command('wincmd P')
    vim.command('q')
    show_list()

EOF
