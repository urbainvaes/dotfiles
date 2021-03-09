# pylint: disable=C0111
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

from qutebrowser.api import interceptor

# Avoid linter errors
c = c
config = config
config.load_autoconfig(False)


def filter_yt(info: interceptor.Request):
    url = info.request_url
    if (url.host() == 'www.youtube.com'
            and url.path() == '/get_video_info'
            and '&adformat=' in url.query()):
        info.block()


# Remove youtube adds
interceptor.register(filter_yt)

# Colors
c.colors.tabs.selected.odd.bg = "#875f5f"
c.colors.tabs.selected.even.bg = "#875f5f"

c.content.images = True
c.downloads.location.prompt = False
c.editor.command = ['urxvt', '-e', 'nvim', '-f', '{}']
c.fonts.hints = 'bold 12pt monospace'
c.hints.chars = 'aoeuidhtns'
c.hints.uppercase = True
c.tabs.show = 'multiple'
c.tabs.tabs_are_windows = False
c.url.start_pages = ['file:///home/urbain/personal/index.html']
c.url.default_page = c.url.start_pages[0]
c.completion.open_categories = ['bookmarks', 'history']

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

config.bind("gh", 'tab-move -')
config.bind("gl", 'tab-move +')
# config.bind("gt", 'tab-next')
# config.bind("gT", 'tab-prev')
config.bind("<Ctrl-L>", 'tab-next')
config.bind("<Ctrl-H>", 'tab-prev')
config.bind("<Ctrl-D>", 'tab-close')
config.bind("<Ctrl-W>", 'do-nothing')

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

# Bindings for command mode
config.bind('<Ctrl-W>', 'fake-key -g <Ctrl-Backspace>', mode='command')
config.bind('<Ctrl-P>', 'completion-item-focus prev', mode='command')
config.bind('<Ctrl-N>', 'completion-item-focus next', mode='command')

# Search engines
c.url.searchengines = {
    'DEFAULT': 'https://www.ecosia.org/search?q={}',
    'amazon': 'https://www.amazon.co.uk/s?k={}',
    'aw': 'https://wiki.archlinux.org/index.php?search={}',
    'ddg': 'https://duckduckgo.com/?q={}',
    'cam': 'https://dictionary.cambridge.org/dictionary/english/{}',
    'dic': 'http://www.dictionary.com/browse/{}',
    'th': 'http://www.thesaurus.com/browse/{}',
    'google': 'https://www.google.com/search?hl=en&q={}',
    'hn': 'https://hn.algolia.com/?query={}',
    'lg': 'http://gen.lib.rus.ec/search.php?req={}',
    'lit': 'https://www.littre.org/recherche?mot={}',
    'scholar': 'https://scholar.google.com/scholar?q={}',
    'tr': 'https://translate.google.com/#en/fr/{}',
    'w': 'https://en.wikipedia.org/wiki/Special:Search?search={}',
    'yt': 'https://www.youtube.com/results?search_query={}',
}

# Aliases
c.aliases = {
    "history-all-clear": 'spawn rm /home/urbain/.local/share/qutebrowser/cmd-history ;; history-clear',
    "wq": 'quit -s', "q": 'quit',
}

# Style sheet
c.content.user_stylesheets = '/home/urbain/dotfiles/qutebrowser/.config/qutebrowser/style.css'
