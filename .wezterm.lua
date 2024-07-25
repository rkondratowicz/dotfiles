local wezterm = require("wezterm")
local config = {}

config.font_size = 17
config.line_height = 1.2

config.use_fancy_tab_bar = false

config.color_scheme = "GruvboxDark"

config.window_padding = {
  left = '3cell',
  right = '3cell',
  top = '1cell',
  bottom = '1cell',
}

config.window_background_opacity = 0.96
config.macos_window_background_blur = 10

config.hide_tab_bar_if_only_one_tab = false
config.window_decorations = "RESIZE"

local function tab_title(tab_info)
  local title = tab_info.tab_title
  if title and #title > 0 then
    return title
  end
  return tab_info.active_pane.title
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, conf, hover, max_width)
    local active_marker = "#b8bb26"
    local normal_marker = "#83a598"
    local marker_text = "#000000"

    local background = "#3c3836"
    local foreground = "#F0F2F5"

    local edge_background = "#282828"

    local left_edge_foreground
    if tab.is_active then
      left_edge_foreground = active_marker
    else
      left_edge_foreground = normal_marker
    end
    
    local edge_foreground = background

    local title = tab_title(tab)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = left_edge_foreground } },
      { Text = " " },

      { Background = { Color = left_edge_foreground } },
      { Foreground = { Color = marker_text } },
      { Text =  (tab.tab_index + 1) .. " " },

      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = " " .. title .. " " },

      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = "" },
    }
  end
)

config.leader = { key = "q", mods = "ALT", timeout_milliseconds = 2000 }
config.keys = {
  {
      mods = "LEADER",
      key = "x",
      action = wezterm.action.CloseCurrentPane { confirm = true }
  },
  {
      mods = "LEADER",
      key = "/",
      action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
  },
  {
      mods = "LEADER",
      key = "-",
      action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
  },
  {
      mods = "LEADER",
      key = "p",
      action = wezterm.action.PaneSelect
  }
}

return config
