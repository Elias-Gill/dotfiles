config.load_autoconfig(True)

# ============  KEYBINDS ===============
config.unbind('q', mode='normal')
config.bind('<Ctrl-p>', 'completion-item-focus --history prev', mode='command')
config.bind('<Ctrl-n>', 'completion-item-focus --history next', mode='command')
config.bind('x', 'tab-close')
config.bind('d', 'scroll-page 0 0.5')
config.bind('u', 'scroll-page 0 -0.5')
config.bind('<Ctrl-L>', 'cmd-set-text -s :open ')
config.bind('<Ctrl-r>', 'reload -f')

# invertir J y K para que funcione como Vimium
config.unbind('J', mode='normal')
config.unbind('K', mode='normal')
config.bind('J', 'tab-next', mode='normal')
config.bind('K', 'tab-prev', mode='normal')

config.bind('<Ctrl-tab>', 'tab-next', mode='normal')
config.bind('<Ctrl-shift-tab>', 'tab-prev', mode='normal')

# ============  OPTIONS ================
c.input.insert_mode.auto_leave = True
c.input.insert_mode.auto_enter = True
c.input.insert_mode.auto_load = True
c.input.insert_mode.plugins = True

c.qt.chromium.process_model = 'process-per-site'
c.qt.chromium.low_end_device_mode = 'always'
c.content.notifications.enabled = False
c.content.autoplay = False

c.url.searchengines["@g"] = "https://www.google.com.ar/search?q={}"

# ==========  COLORSCHEME ==============

# ---- Statusbar ----
c.colors.statusbar.normal.bg = '#ffffff'
c.colors.statusbar.normal.fg = '#000000'
c.colors.statusbar.url.fg = '#000000'
c.colors.statusbar.url.success.https.fg = '#000000'
c.colors.statusbar.url.success.http.fg = '#d32f2f'
c.colors.statusbar.url.warn.fg = '#6a1b9a'
c.colors.statusbar.url.error.fg = '#b00020'
c.colors.statusbar.url.hover.fg = '#676767'
c.colors.statusbar.progress.bg = '#434343'

# ---- Insert mode ----
c.colors.statusbar.insert.bg = '#1e88e5'
c.colors.statusbar.insert.fg = '#ffffff'

# ---- Command / caret / private (sin cambios visuales) ----
c.colors.statusbar.command.bg = '#404040'
c.colors.statusbar.command.fg = '#e0e0ff'

c.colors.statusbar.caret.bg = '#4a3a4a'
c.colors.statusbar.caret.fg = '#ffd0ff'

c.colors.statusbar.private.bg = '#6a1b9a'
c.colors.statusbar.private.fg = '#e0e0e0'

# ---- Prompts ----
c.colors.prompts.bg = '#252525'
c.colors.prompts.fg = '#e0e0e0'
c.colors.prompts.selected.bg = '#404040'
c.colors.prompts.selected.fg = '#ffffff'

# ---- Completion ----
c.colors.completion.item.selected.bg = '#404040'
c.colors.completion.item.selected.fg = '#ffffff'
c.colors.completion.even.bg = '#2e2e2e'
c.colors.completion.odd.bg = '#282828'
c.colors.completion.match.fg = '#a0c0ff'

# ---- Tabs ----
c.colors.tabs.bar.bg = '#ffffff'

# Tab activa
c.colors.tabs.selected.odd.bg = '#ffffff'
c.colors.tabs.selected.even.bg = '#ffffff'
c.colors.tabs.selected.odd.fg = '#444444'
c.colors.tabs.selected.even.fg = '#444444'

# Inactivas
c.colors.tabs.odd.bg = '#ededed'
c.colors.tabs.even.bg = '#ededed'
c.colors.tabs.odd.fg = '#000000'
c.colors.tabs.even.fg = '#000000'

# ---- Downloads ----
c.colors.downloads.bar.bg = '#2e2e2e'
c.colors.downloads.error.bg = '#5a2e2e'
c.colors.downloads.error.fg = '#ffcccc'
c.colors.downloads.start.bg = '#2e5a2e'
c.colors.downloads.start.fg = '#ccffcc'
c.colors.downloads.stop.bg = '#5a5a2e'
c.colors.downloads.stop.fg = '#ffffcc'


# ---- Hints ----
c.colors.hints.bg = '#5a5a2e'
c.colors.hints.fg = '#e0e0e0'
c.colors.hints.match.fg = '#a0c0ff'

# ---- Messages ----
c.colors.messages.error.bg = '#5a2e2e'
c.colors.messages.error.fg = '#ffcccc'

c.colors.messages.info.bg = '#2e5a2e'
c.colors.messages.info.fg = '#ccffcc'

c.colors.messages.warning.bg = '#5a5a2e'
c.colors.messages.warning.fg = '#ffffcc'

# ---- Webpage background ----
# Blanco para coherencia con el resto
c.colors.webpage.bg = '#ffffff'
