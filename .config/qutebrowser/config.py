config.load_autoconfig(True)

# ============  KEYBINDS ===============
config.bind('<Ctrl-p>', 'completion-item-focus --history prev', mode='command')
config.bind('<Ctrl-n>', 'completion-item-focus --history next', mode='command')
config.bind('x', 'tab-close')
config.bind('d', 'scroll-page 0 0.5')
config.bind('u', 'scroll-page 0 -0.5')
config.bind('<Ctrl-L>', 'cmd-set-text -s :open ')
config.bind('<Ctrl-r>', 'reload -f')

# ============  OPTIONS ================
c.input.insert_mode.auto_leave = True
c.input.insert_mode.auto_enter = True
c.input.insert_mode.auto_load = True
c.input.insert_mode.plugins = True

# ==========  COLORSCHEME ==============
c.colors.statusbar.normal.bg = '#2e2e2e'
c.colors.statusbar.normal.fg = '#e0e0e0'

c.colors.statusbar.insert.bg = '#3a4a3a'
c.colors.statusbar.insert.fg = '#d0ffd0'

c.colors.statusbar.command.bg = '#3a3a4a'
c.colors.statusbar.command.fg = '#e0e0ff'

c.colors.statusbar.caret.bg = '#4a3a4a'
c.colors.statusbar.caret.fg = '#ffd0ff'

c.colors.statusbar.private.bg = '#2e2e3e'
c.colors.statusbar.private.fg = '#e0e0e0'

c.colors.prompts.bg = '#252525'
c.colors.prompts.fg = '#e0e0e0'
c.colors.prompts.selected.bg = '#404040'
c.colors.prompts.selected.fg = '#ffffff'

c.colors.completion.item.selected.bg = '#404040'
c.colors.completion.item.selected.fg = '#ffffff'

c.colors.completion.even.bg = '#2e2e2e'
c.colors.completion.odd.bg = '#282828'

c.colors.completion.match.fg = '#a0c0ff'

c.colors.tabs.bar.bg = '#222222'
c.colors.tabs.odd.bg = '#2e2e2e'
c.colors.tabs.even.bg = '#282828'
c.colors.tabs.selected.odd.bg = '#404040'
c.colors.tabs.selected.even.bg = '#404040'
c.colors.tabs.selected.odd.fg = '#e0e0ff'
c.colors.tabs.selected.even.fg = '#e0e0ff'

c.colors.downloads.bar.bg = '#2e2e2e'
c.colors.downloads.error.bg = '#5a2e2e'
c.colors.downloads.error.fg = '#ffcccc'
c.colors.downloads.start.bg = '#2e5a2e'
c.colors.downloads.start.fg = '#ccffcc'
c.colors.downloads.stop.bg = '#5a5a2e'
c.colors.downloads.stop.fg = '#ffffcc'

c.colors.hints.bg = '#5a5a2e'
c.colors.hints.fg = '#e0e0e0'
c.colors.hints.match.fg = '#a0c0ff'

c.colors.messages.error.bg = '#5a2e2e'
c.colors.messages.error.fg = '#ffcccc'

c.colors.messages.info.bg = '#2e5a2e'
c.colors.messages.info.fg = '#ccffcc'

c.colors.messages.warning.bg = '#5a5a2e'
c.colors.messages.warning.fg = '#ffffcc'

c.colors.webpage.bg = '#1e1e1e'

