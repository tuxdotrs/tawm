local awful = require("awful")

local mod = require("binds.mod")
local modkey = mod.modkey

local apps = require("config.apps")

--- Global key bindings
awful.keyboard.append_global_keybindings({
  -- General Awesome keys.
  awful.key(
    { modkey },
    "h",
    require("awful.hotkeys_popup").show_help,
    { description = "show help", group = "awesome" }
  ),
  awful.key({ modkey, mod.shift }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
  awful.key({ modkey, mod.shift }, "x", awesome.quit, { description = "quit awesome", group = "awesome" }),

  awful.key({ modkey, mod.shift }, "p", function()
    awful.spawn.with_shell("poweroff")
  end, { description = "poweroff", group = "awesome" }),

  -- Apps related keybindings
  awful.key({ modkey }, "a", function()
    awful.spawn("rofi -show drun")
  end, { description = "run prompt", group = "launcher" }),

  awful.key({ modkey }, "Return", function()
    awful.spawn(apps.terminal)
  end, { description = "open terminal", group = "launcher" }),

  awful.key({ modkey, mod.shift }, "Return", function()
    awful.spawn(apps.terminal_floating)
  end, { description = "open floating terminal", group = "launcher" }),

  awful.key({ modkey }, "e", function()
    awful.spawn(apps.editor_cmd)
  end, { description = "open neovim", group = "launcher" }),

  awful.key({ modkey }, "n", function()
    awful.spawn(apps.neovide)
  end, { description = "open neovide", group = "launcher" }),

  awful.key({ modkey }, "b", function()
    awful.spawn(apps.browser)
  end, { description = "open browser", group = "launcher" }),

  awful.key({ modkey }, "d", function()
    awful.spawn("discord")
  end, { description = "open discord", group = "launcher" }),

  awful.key({ modkey }, "g", function()
    awful.spawn("GalaxyBudsClient")
  end, { description = "open galaxy buds client", group = "launcher" }),

  awful.key({ modkey }, "t", function()
    awful.spawn(apps.file_explorer)
  end, { description = "open file explorer", group = "launcher" }),

  awful.key({ modkey }, "s", function()
    awful.spawn("spotify")
  end, { description = "open spotify", group = "launcher" }),

  awful.key({ modkey }, "v", function()
    awful.spawn("copyq show")
  end, { description = "open clipboard manager", group = "launcher" }),

  -- Focus related keybindings.
  awful.key({ modkey }, "Left", function()
    awful.client.focus.bydirection("left")
  end, { description = "Focus window to the left", group = "Client" }),
  awful.key({ modkey }, "Right", function()
    awful.client.focus.bydirection("right")
  end, { description = "Focus window to the right", group = "Client" }),
  awful.key({ modkey }, "Up", function()
    awful.client.focus.bydirection("up")
  end, { description = "Focus window above", group = "Client" }),
  awful.key({ modkey }, "Down", function()
    awful.client.focus.bydirection("down")
  end, { description = "Focus window below", group = "Client" }),
  awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),

  -- Swap related keybindings.
  awful.key({ modkey, mod.shift }, "Left", function()
    awful.client.swap.bydirection("left")
  end, { description = "Swap window to the left", group = "Client" }),
  awful.key({ modkey, mod.shift }, "Right", function()
    awful.client.swap.bydirection("right")
  end, { description = "Swap window to the right", group = "Client" }),
  awful.key({ modkey, mod.shift }, "Up", function()
    awful.client.swap.bydirection("up")
  end, { description = "Swap window above", group = "Client" }),
  awful.key({ modkey, mod.shift }, "Down", function()
    awful.client.swap.bydirection("down")
  end, { description = "Swap window below", group = "Client" }),

  -- Width related keybindings.
  awful.key({ modkey, mod.ctrl }, "Left", function()
    awful.tag.incmwfact(-0.05)
  end, { description = "decrease master width factor", group = "layout" }),
  awful.key({ modkey, mod.ctrl }, "Right", function()
    awful.tag.incmwfact(0.05)
  end, { description = "increase master width factor", group = "layout" }),

  -- Wibar related keybindings.
  awful.key({ modkey, mod.shift }, "b", function()
    for s in screen do
      if s.mywibox then
        s.mywibox.visible = not s.mywibox.visible
      end
    end
  end, { description = "hide bar", group = "layout" }),

  -- Tag related keybindings.
  awful.key({
    modifiers = { modkey },
    keygroup = "numrow",
    description = "only view tag",
    group = "tag",
    on_press = function(index)
      local tag = awful.screen.focused().tags[index]
      if tag then
        tag:view_only()
      end
    end,
  }),
  awful.key({
    modifiers = { modkey, mod.shift },
    keygroup = "numrow",
    description = "move focused client to tag",
    group = "tag",
    on_press = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end,
  }),

  -- Keyboard brightness related keybindings.
  awful.key({}, "XF86KbdBrightnessUp", function()
    awful.spawn("asusctl -n")
  end, { description = "increase keyboard brightness", group = "system" }),
  awful.key({}, "XF86KbdBrightnessDown", function()
    awful.spawn("asusctl -p")
  end, { description = "decrease keyboard brightness", group = "system" }),

  -- Screen brightness related keybindings.
  awful.key({}, "XF86MonBrightnessUp", function()
    awful.spawn("brightnessctl s +20%")
  end, { description = "increase screen brightness", group = "system" }),
  awful.key({}, "XF86MonBrightnessDown", function()
    awful.spawn("brightnessctl s 20%-")
  end, { description = "decrease screen brightness", group = "system" }),

  -- Performance related keybindings.
  awful.key({}, "XF86Launch4", function()
    awful.spawn("asusctl profile -n")
  end, { description = "cycle through performance mode", group = "system" }),

  -- Volume related keybindings.
  awful.key({}, "XF86AudioRaiseVolume", function()
    awful.spawn("amixer sset Master 10%+")
  end, { description = "increase speaker volume", group = "system" }),
  awful.key({}, "XF86AudioLowerVolume", function()
    awful.spawn("amixer sset Master 10%-")
  end, { description = "decrease speaker volume", group = "system" }),
  awful.key({}, "XF86AudioMute", function()
    awful.spawn("amixer sset Master 1+ toggle")
  end, { description = "toggle speaker mute", group = "system" }),
})
