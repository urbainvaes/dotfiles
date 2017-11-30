# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

c.downloads.location.prompt = False
c.editor.command = ['urxvt', '-e', 'vim', '-f', '{}']
c.hints.chars = 'aoeuidhtns'
c.hints.uppercase = True
c.tabs.favicons.show = False
c.tabs.show = 'multiple'
c.tabs.tabs_are_windows = True
c.url.default_page = 'about:blank'
c.url.start_pages = ['about:blank']

# Bindings for normal mode
config.bind(",b", 'spawn --userscript explorer -b')
config.bind(",d", 'spawn --userscript dictionary-search')
config.bind(",h", 'spawn --userscript explorer -h')
config.bind(",p", 'spawn --userscript explorer')
config.bind(",t", 'spawn --userscript explorer -t')
config.bind(",v", 'spawn mpv {url}')
config.bind(",V", 'hint links spawn mpv {hint-url}')
config.bind("]d", 'set downloads.location.prompt True')
config.bind("[d", 'set downloads.location.prompt False')
config.unbind("d")
config.bind("do", 'download-open')
config.bind("o", 'set-cmd-text -s :spawn --userscript url-from-surfraw')
config.bind("t", 'set-cmd-text -s :spawn --userscript url-from-surfraw -t')
config.bind("f", 'hint all current')

# Bindings for insert mode
config.bind("<Ctrl-A>", 'fake-key <Home>', mode='insert')
config.bind("<Ctrl-H>", 'fake-key <Backspace>', mode='insert')
config.bind("<Ctrl-W>", 'fake-key <Ctrl-Backspace>', mode='insert')
config.bind("<Ctrl-E>", 'fake-key <End>', mode='insert')
config.bind("<Ctrl-F>", 'fake-key <Right>', mode='insert')
config.bind("<Ctrl-B>", 'fake-key <Left>', mode='insert')
config.bind("<Ctrl-N>", 'fake-key <Down>', mode='insert')
config.bind("<Ctrl-P>", 'fake-key <Up>', mode='insert')

# Bindings for command mode
config.bind('<Ctrl-W>', 'fake-key -g <Ctrl-Backspace>', mode='command')

# Search engines
c.url.searchengines = {
    'DEFAULT': 'https://startpage.com/do/search?query={}',
    'yt': 'https://www.youtube.com/results?search_query={}',
    'ddg': 'https://duckduckgo.com/?q={}',
    'google': 'https://duckduckgo.com/?q={}',
    'aw': 'https://wiki.archlinux.org/index.php?search={}',
}
