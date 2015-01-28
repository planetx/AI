function AI_OnWorldTick(World, TickCount)

  local MobThinkAct = function(Mob)
    -- Check to see if the cEntity is a cMonster
    if (Mob:IsMob()) then
      actThinkStore(Mob)
    end
  end

  AI_Lock = AI_Lock + TickCount

  -- Keep the load low
  if (AI_Lock > 250 and World ~= AI_World) then
    AI_Lock = 0
    AI_World = World
    -- Update all the mob info
    World:ForEachEntity(MobThinkAct);      
    -- Clear out the mobs that no longer exist

    for uuid, mob in pairs(AI_Mob) do
      if (not mob['mob']:IsMob()) then
        AI_Mob[uuid] = nil
      end      
    end

  end

  return false;
end
