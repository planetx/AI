function Handle_AI_Command(Split, Player)
  if (#Split < 2) then
    Player:SendMessage("Usage: /ai [command] [arguments]")
    Player:SendMessage("Usage: /ai list     ~ List interactive mobs for Player")
    return true
  end

  if (Split[2] == "list") then
    Player:SendMessage("list/")
    for uuid, mob in pairs(AI_Mob) do
      if (mob['target'] == Player:GetUniqueID()) then
        Player:SendMessage("[AI] " .. mob['type'] .. " @ " .. mob['distance'])
      end      
    end
    Player:SendMessage("/list")
  elseif (Split[2] == "reload") then
    -- tada!
  end

  return true
end
