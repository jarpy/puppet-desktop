# Fix mouse-focus after tag switch
tag.connect_signal(
  "property::selected",
  function (t)
    local selected = tostring(t.selected) == "false"
    if selected then
      local focus_timer = timer({ timeout = 0.2 })
      focus_timer:connect_signal("timeout", function()
        local c = awful.mouse.client_under_pointer()
        if not (c == nil) then
          client.focus = c
          c:raise()
        end
        focus_timer:stop()
      end)
      focus_timer:start()
    end
  end
)
