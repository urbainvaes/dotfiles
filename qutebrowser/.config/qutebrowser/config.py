# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

c.downloads.location.prompt = False
c.editor.command = ['urxvt', '-e', 'nvim', '-f', '{}']
c.fonts.hints = 'bold 12pt monospace'
c.hints.chars = 'aoeuidhtns'
c.hints.uppercase = True
c.tabs.favicons.show = False
c.tabs.show = 'multiple'
c.tabs.tabs_are_windows = True
c.url.start_pages = ['file:///home/urbain/personal/index.html']
c.url.default_page = c.url.start_pages[0]

# Bindings for normal mode
config.bind(",b", 'spawn --userscript explorer -b')
config.bind(",ch", 'history-all-clear')
config.bind(",p", 'spawn --userscript explorer')
config.bind(",t", 'spawn --userscript explorer -t')
config.bind(",v", 'spawn -d mpv {url}')
config.bind(";v", 'hint links spawn -d mpv {hint-url}')
config.bind(",x", 'spawn --userscript user-password')
config.bind("]d", 'set downloads.location.prompt True')
config.bind("[d", 'set downloads.location.prompt False')
config.bind(",do", 'download-open')
config.bind(",db", 'spawn -d downloads')
config.bind(",o", 'set-cmd-text -s :spawn --userscript url-from-surfraw')
config.bind(",O", 'set-cmd-text -s :spawn --userscript url-from-surfraw -t')
config.bind("f", 'hint all current')

# Bindings for insert mode
# config.unbind("<Ctrl-A>", mode='insert')
config.bind("<Ctrl-A>", 'fake-key <Home>', mode='insert')
config.bind("<Ctrl-E>", 'fake-key <End>', mode='insert')
config.bind("<Ctrl-H>", 'fake-key <Backspace>', mode='insert')
config.bind("<Ctrl-W>", 'fake-key <Ctrl-Backspace>', mode='insert')
config.bind("<Ctrl-F>", 'fake-key <Right>', mode='insert')
config.bind("<Ctrl-B>", 'fake-key <Left>', mode='insert')
config.bind("<Ctrl-N>", 'fake-key <Down>', mode='insert')
config.bind("<Ctrl-P>", 'fake-key <Up>', mode='insert')
config.bind("<Ctrl-I>", 'open-editor', mode='insert')
config.bind("<Ctrl-X>", 'spawn --userscript user-password', mode='insert')
config.unbind("<Shift-Ins>", mode="insert") # Fix bug with shift-insert

# Bindings for command mode
config.bind('<Ctrl-W>', 'fake-key -g <Ctrl-Backspace>', mode='command')
config.bind('<Ctrl-P>', 'completion-item-focus prev', mode='command')
config.bind('<Ctrl-N>', 'completion-item-focus next', mode='command')

# Search engines
c.url.searchengines = {
    'DEFAULT': 'https://startpage.com/do/search?query={}',
    'aw': 'https://wiki.archlinux.org/index.php?search={}',
    'ddg': 'https://duckduckgo.com/?q={}',
    'dic': 'https://dictionary.cambridge.org/dictionary/english/{}',
    'google': 'https://www.google.com/search?hl=en&q={}',
    'hn': 'https://hn.algolia.com/?query={}',
    'scholar': 'https://scholar.google.com/scholar?q={}',
    'tr': 'https://translate.google.com/#en/fr/{}',
    'yt': 'https://www.youtube.com/results?search_query={}',
}

# Aliases
c.aliases = {
    "history-all-clear": 'spawn rm /home/urbain/.local/share/qutebrowser/cmd-history ;; history-clear',
    "wq": 'quit -s',
}
