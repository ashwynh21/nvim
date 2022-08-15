--[[  
     _    ____  _   _    ____             __ _       		 
    / \  |  _ \| | | |  / ___|___  _ __  / _(_) __ _ 
   / _ \ | | | | |_| | | |   / _ \| '_ \| |_| |/ _` |
  / ___ \| |_| |  _  | | |__| (_) | | | |  _| | (_| |
 /_/   \_\____/|_| |_|  \____\___/|_| |_|_| |_|\__, |
                                               |___/ 
]]--

-- [[ Imports ]]
package.path = package.path .. ';C:/Users/ashwyn/AppData/local/nvim/?.lua'

require('src/vars')
require('src/opts')
require('src/plug')
require('src/keys')

-- Pretty print lua table
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end

