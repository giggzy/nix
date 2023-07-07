function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

local utils = require("telescope.utils")
local cwd = vim.fn.stdpath "config" .. "/../"

print(cwd)

local search_dirs = {}
for _, dir in ipairs(astronvim.supported_configs) do -- search all supported config locations
  if dir == astronvim.install.home then dir = dir .. "/lua/user" end -- don't search the astronvim core files
  if vim.fn.isdirectory(dir) == 1 then table.insert(search_dirs, dir) end -- add directory to search if exists
end

if vim.tbl_isempty(search_dirs) then -- if no config folders found, show warning
  print("No user configuration files found")
end

-- if vim.is_not_empty(search_dirs) then
--   print("User configuration files found!!!!!!")
-- end
--if #search_dirs == 1 then cwd = search_dirs[1] end 
print("Search Dirs: ", search_dirs)
print("Searach Dirs count: ", #search_dirs)
print("CWD: ", cwd)

print("Search Dirs:", dump(search_dirs))

-- utils.notify("GABE 1" )
require("telescope.builtin").find_files {
   -- prompt_title = "Gabe Config Files, Search Dirs: " .. search_dirs[1],
   prompt_title = "Gabe Config Files, Search Dirs: " .. cwd,
   -- prompt_title = "The command being run is: " .. opts.find_command,
   -- search_dirs = search_dirs,
   cwd = utils.buffer_dir(),
   --find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
   prompt_prefix = "  ",
} 

