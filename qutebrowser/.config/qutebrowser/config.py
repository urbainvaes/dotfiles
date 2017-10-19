# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

c.editor.command = ['urxvt', '-e', 'vim', '-f', '{}']
c.hints.chars = 'aoeuidhtns'
c.hints.uppercase = True
c.tabs.favicons.show = False
c.url.default_page = 'about:blank'
c.url.start_pages = ['about:blank']
c.tabs.show = 'multiple'
c.tabs.tabs_are_windows = True

# Bindings for normal mode
config.bind("o", 'set-cmd-text -s :spawn --userscript url-from-surfraw')
config.bind("t", 'set-cmd-text -s :spawn --userscript url-from-surfraw -t')
config.bind(",p", 'spawn --userscript explorer')
config.bind(",t", 'spawn --userscript explorer -t')
config.bind(",h", 'spawn --userscript explorer -h')
config.bind(",b", 'spawn --userscript explorer -b')
config.bind(",d", 'spawn --userscript dictionary-search')

# Bindings for insert mode
config.bind("<Ctrl-a>", 'fake-key <Home>', mode='insert')
config.bind("<Ctrl-h>", 'fake-key <Backspace>', mode='insert')
config.bind("<Ctrl-w>", 'fake-key <Ctrl-Backspace>', mode='insert')
config.bind("<Ctrl-e>", 'fake-key <End>', mode='insert')
config.bind("<Ctrl-f>", 'fake-key <Right>', mode='insert')
config.bind("<Ctrl-b>", 'fake-key <Left>', mode='insert')
