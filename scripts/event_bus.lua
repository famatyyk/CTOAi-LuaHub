--- Prosty system zdarzen (event bus) dla moda/gry w Lua.
--- Wzorzec: rejestracja sluchaczy + emit. Bez globali, bez load.

local M = {}

function M.new()
  local listeners = {}
  local bus = {}

  function bus.on(event, fn)
    listeners[event] = listeners[event] or {}
    table.insert(listeners[event], fn)
  end

  function bus.emit(event, payload)
    local ls = listeners[event]
    if not ls then return end
    for _, fn in ipairs(ls) do
      local ok, err = pcall(fn, payload)
      if not ok then
        print("blad w sluchaczu " .. event .. ": " .. tostring(err))
      end
    end
  end

  return bus
end

return M
