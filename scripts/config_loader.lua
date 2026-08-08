--- Bezpieczny loader konfiguracji w Lua.
-- NIE uzywa load()/loadfile()/os.execute() — tylko io + table.
-- To jest wzorzec rekomendowany przez Project Doctor (brak ryzyka).

local M = {}

function M.load(path)
  local t = {}
  local f = io.open(path, "r")
  if not f then return nil, "brak pliku: " .. path end
  for line in f:lines() do
    line = line:match("^%s*(.-)%s*$")  -- trim
    if line ~= "" and not line:match("^%s*%-%-") then
      local k, v = line:match("^(%w+)%s*=%s*(.+)$")
      if k and v then
        v = v:gsub('"', "")
        t[k] = v
      end
    end
  end
  f:close()
  return t
end

return M
