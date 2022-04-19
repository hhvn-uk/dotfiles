from PyQt5.QtCore import QUrl
from qutebrowser.api import interceptor
from qutebrowser.browser import commands
import subprocess

# import <str> can mean import ./<str>.py apparently.
# Great, transparent, design.
import search
import stylesheets

# Qutebrowser requires me to tell it this or else it 
# gives an annoying message each time it opens.
config.load_autoconfig(False)

# Save tabs + urls
c.auto_save.session = True

# Didn't ask.
c.changelog_after_upgrade = 'never'

# Don't annoy me.
c.new_instance_open_target = 'tab-bg-silent'

# Selected tabs
c.colors.tabs.selected.even.bg = '#1b364b'
c.colors.tabs.selected.odd.bg  = '#1b364b'
c.colors.tabs.selected.even.fg = 'white'
c.colors.tabs.selected.odd.fg  = 'white'

# Unselected tabs
c.colors.tabs.even.bg = '#050a10'
c.colors.tabs.odd.bg  = '#050a10'
c.colors.tabs.even.fg = 'white'
c.colors.tabs.odd.fg  = 'white'

# Tabbed muscle memory
config.bind('<Alt-q>', 'tab-close')
config.bind('<Alt-h>', 'tab-prev')
config.bind('<Alt-l>', 'tab-next')
config.bind('<Alt-Shift-h>', 'tab-prev')
config.bind('<Alt-Shift-l>', 'tab-next')

# Darkmode
c.colors.webpage.bg = '#050a10'
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.policy.images = 'never'
c.colors.webpage.darkmode.policy.page = 'always'
c.colors.webpage.preferred_color_scheme = 'dark'

# Configuration
## cd to qutebrowser dir before editing to get quick access to other files
c.editor.command = ['rc', '-c', 'cd `$nl{dirname \'{file}\'}; st -e vim `$nl{basename \'{file}\'}']
config.bind('R', 'config-source')
config.bind('e', 'config-edit')

# I need to plumb
config.bind('d', 'hint all spawn plumb {hint-url}')
config.bind('D', 'hint all spawn rc -c \'net/download -d {hint-url}\'')
config.bind('v', 'hint all spawn rc -c \'nohup mpv --pause {hint-url} >/dev/null >[2]/dev/null &\'')

# Warp the mouse as seen by qtwebengine
config.bind('a', 'hint all hover')

# Alphabet soup
config.bind('A', 'spawn --userscript randomagent')
c.content.headers.user_agent = '.'

# Stylesheets
c.content.user_stylesheets = stylesheets.list

# Home/default page
c.url.default_page = 'about:blank'
config.bind('~', 'open file:///home/hayden/.config/qutebrowser/home.html')

# Hint characters.
# Same as the default, but with f placed last. It seems that qutebrowser will
# construct multichar hints by going right to left to select the first char.
# Since f is the default hint binding I think this will make hints quicker to
# type as my finger should already be on f when it is generating hints such as
# 'fa', 'fb', 'fc'...
c.hints.chars = 'asdlghjkf'

# Search (search.py)
c.url.open_base_url = True
c.url.searchengines = search.list

# Security
## Uh-oh gmail might break with this option! Oh no!
c.content.cookies.accept = 'no-3rdparty'
## DNT does nothing but provide a more unique fingerprint
c.content.headers.do_not_track = None
## I know, I know, but I don't care.
c.downloads.prevent_mixed_content = False

# Redirects
def domainredir(info: interceptor.Request):
    host = info.request_url.host()
    target = QUrl(info.request_url)

    # Fuck python. Why can't I split these out on to multiple lines and indent
    # them? Why can't you give me a switch statement? I would love for
    # string-capable switch statements to exist in more languages.
    if (host == 'twitter.com' or host == 'www.twitter.com' or host == 'mobile.twitter.com'):
        target.setHost('nitter.net');
    elif (host == 'reddit.com' or host == 'www.reddit.com' or host == 'old.reddit.com'):
        target.setHost('teddit.net');
    elif (host == 'instagram.com' or host == 'www.instagram.com'):
        target.setHost('bibliogram.art');
    elif (host == 'en.m.wikipedia.org'):
        target.setHost('en.wikipedia.org');
    elif (host == 'npr.org' or host == 'www.npr.org'):
        target.setHost('text.npr.org');
    else:
        return

    try:
        info.redirect(target)
    except interceptor.interceptors.RedirectException:
        pass
interceptor.register(domainredir)

# Clipboard (use primary for everything)
config.unbind('Pp')
config.unbind('PP')
config.unbind('pp')
config.unbind('pP')
config.unbind('yD')
config.unbind('yM')
config.unbind('yP')
config.unbind('yT')
config.unbind('yY')
config.bind('P', 'open -t -- {primary}')
config.bind('p', 'open -- {primary}')
config.bind('yd', 'yank domain -s')
config.bind('ym', 'yank inline [{title}]({url}) -s')
config.bind('yp', 'yank pretty-url -s')
config.bind('yt', 'yank title -s')
config.bind('yy', 'yank -s')
