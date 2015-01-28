function Handle_AI_Command(Split, Player)
  if (#Split ~= 2) then
    Player:SendMessage("Usage: /ai [command] [arguments]")
    return true
  end

  if (Split[2] == "list") then
    Player:SendMessage("list/")
    for uuid, mob in pairs(AI_Mob) do
      if (mob['target'] == Player and mob['mob']:IsMob()) then
        Player:SendMessage("[AI] " .. mob['type'] .. " @ " .. mob['distance'])
      else
        AI_Mob[uuid] = nil
      end      
    end
    Player:SendMessage("/list")
  elseif (Split[2] == "reload") then
    -- tada!
  end

  return true
end

