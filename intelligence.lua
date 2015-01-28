function actThinkStore(Mob)

  local MobPlayerRelationship = function(Player, Mob)
    -- Get the unique ID
    uuid = Mob:GetUniqueID()

    -- Get the current data
    local m = AI_Mob[uuid]

    -- If no data, create a new table
    if (m == nil) then
      m = {}
    end

    -- Start updating the data
    m["uuid"]    = Mob:GetUniqueID()
    m["type"]    = Mob:GetClass()
    m["world"]   = Mob:GetWorld()       
    if (m["last"] == nil) then
      m["last"] = os.clock()
    end
    m['mob']     = Mob
    -- Update Mob Position
    local c = {}
    c["x"]       = Mob:GetPosX()
    c["y"]       = Mob:GetPosY()
    c["z"]       = Mob:GetPosZ()
    m["coords"]  = c

    local distance = math.sqrt( 
      math.pow(Mob:GetPosX() - Player:GetPosX(), 2) 
      + math.pow(Mob:GetPosY() - Player:GetPosY(), 2) 
      + math.pow(Mob:GetPosZ() - Player:GetPosZ(), 2)
    )

    local old_distance = m['distance']

    if (old_distance == nil) then
      old_distance = 1000
    end

    if (distance < 25) then
      if (distance < old_distance) then
        m['distance'] = distance
        m['target'] = Player
      end
      --
      -- Store the results
      --
      AI_Mob[uuid] = m
    elseif (Player == m['target']) then
      m['distance'] = distance
      AI_Mob[uuid] = m
    else
      AI_Mob[uuid] = nil
    end
    return false
  end

  Mob:GetWorld():ForEachPlayer(MobPlayerRelationship, Mob)


end