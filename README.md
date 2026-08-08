# CTOAi-LuaHub

Zbiór gotowych, **bezpiecznych** skryptów Lua dla modderów i twórców gier
(love2d, Garry's Mod, Factorio, własne enginy). Każdy skrypt przechodzi
weryfikację: brak `load`/`loadstring`/`os.execute`, brak modyfikacji globali.

## Dlaczego bezpieczne?

Project Doctor (moduł `cpp_lua.py`) flaguje `load`/`os.execute` jako HIGH.
Te skrypty celowo ich NIE używają — są wzorcami do kopiowania.

## Skrypty

| Plik | Co robi |
|---|---|
| `scripts/hello_world.lua` | Minimalny moduł (`return M` pattern) |
| `scripts/config_loader.lua` | Loader configu z pliku (io + table, bez load) |
| `scripts/event_bus.lua` | System zdarzeń (on/emit) dla moda/gry |

## Użycie

```lua
local bus = require("scripts.event_bus")
local b = bus.new()
b.on("tick", function(p) print("tick", p) end)
b.emit("tick", 42)
```

## Weryfikacja

```bash
lua -e "assert(loadfile('scripts/event_bus.lua'))"
```

Wszystkie skrypty w `scripts/` przechodzą parse-check i runtime test.

## Powiązane

- Audyt Lua/C++: https://ctoai-funnel.fly.dev/ (od 19 €)
- Project Doctor: https://github.com/famatyyk/CTOAi-Project-Doctor
