--- Prosty moduł demonstracyjny Lua (bezpieczny wzorzec).
-- Cel: pokazać strukturę skryptu modderskiego, który można
-- rozszerzyć bez użycia load/os.execute (patrz project-doctor cpp_lua.py).

local M = {}

function M.greet(name)
  name = name or "swiecie"
  return "Czesc, " .. name .. "!"
end

return M
