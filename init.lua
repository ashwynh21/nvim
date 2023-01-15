--
--  _____________________   ____(_)______ ___
--  __  __ \  _ \  __ \_ | / /_  /__  __ `__ \
--  _  / / /  __/ /_/ /_ |/ /_  / _  / / / / /
--  /_/ /_/\___/\____/_____/ /_/  /_/ /_/ /_/
--
-- Vanilla Config

package.path = package.path .. 'C:\\Users\\ashwy\\AppData\\local\\nvim\\?.lua;'

require('src.settings')
require('src/autocmd')
require('src.plugins')
require('src.keybinds')

---Pretty print lua table
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end
