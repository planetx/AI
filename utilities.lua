function tprint (tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      LOG(formatting)
      tprint(v, indent+1)
    elseif type(v) == 'boolean' then
      LOG(formatting .. tostring(v))      
    else
      LOG(formatting .. tostring(v))
    end
  end
end

function pDump (tbl, Player, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      Player:SendMessage(formatting)
      pDump(v, Player, indent+1)
    elseif type(v) == 'boolean' then
      Player:SendMessage(formatting .. tostring(v))      
    else
      Player:SendMessage(formatting .. tostring(v))
    end
  end
end

