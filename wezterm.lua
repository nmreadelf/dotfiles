local wezterm = require 'wezterm';
local mykeys = {
    {key="C", mods="ALT", action="Copy"},
    {key="V", mods="ALT", action="Paste"},
    {key="t", mods="ALT", action=wezterm.action{SpawnCommandInNewTab={ args={"bash"} }}},
    {key="]", mods="ALT", action=wezterm.action{ActivateTabRelative=1}},
    {key="[", mods="ALT", action=wezterm.action{ActivateTabRelative=-1}},
    {key="w", mods="ALT", action=wezterm.action{CloseCurrentTab={confirm=true}}},
}

for i = 1, 8 do
  table.insert(mykeys, {
    key=tostring(i),
    mods="ALT",
    action=wezterm.action{ActivateTab=i-1},
  })
end

return {
  keys = mykeys,
  -- color_scheme = "Monokai Remastered",
  color_scheme = "Solarized Dark Higher Contrast",
  font = wezterm.font("Consolas"),
  font_size = 20.0,
}
