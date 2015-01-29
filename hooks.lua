function AI_PlayerMobInteraction(Player, Mob)
  LOG("[AI] Interaction(" .. Mob:GetUniqueID() .. "," .. Player:GetUniqueID() .. ")")
  return true
end


function AI_OnWorldTick(World, TickCount)

  local checkThinkStore = function(Mob)
    -- Check to see if the cEntity is a cMonster
    if (Mob:IsMob()) then
      updateThinkStore(Mob)
    end
  end

  local actionThinkStore = function(Mob)
    local mobData = AI_Mob[Mob:GetUniqueID()] 
    LOG("[AI] debug " .. mobData['target'] .. "," .. mobData['uuid'] .. "@" .. mobData['distance']) 
    Mob:GetWorld():DoWithPlayerByUUID(mobData['target'], AI_PlayerMobInteraction, Mob) 
    return true
  end


  AI_Lock = AI_Lock + 1

  -- Keep the load low
  if (AI_Lock > 20 and World ~= AI_World) then
    AI_Lock = 0
    AI_World = World
    -- Update all the mob info
    World:ForEachEntity(checkThinkStore)    
    -- Have interactive mobs do stuff and
    -- clear out the mobs that no longer exist
    for uuid, mob in pairs(AI_Mob) do
      World:DoWithEntityByID(mob['uuid'], actionThinkStore)
    end
  end

  return false
end

