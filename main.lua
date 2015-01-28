function Initialize(Plugin)
  --
  -- Set name and version
  --
  Plugin:SetName("AI")
  Plugin:SetVersion(2015012401)

  math.randomseed(os.time())
  --
  -- Set Global Mob Table
  AI_Mob = {}
  --
  -- Set Update Counter
  AI_Lock = 0
  --
  -- Set Update World
  AI_World = nil
  --
  -- Command bindings
  --
  cPluginManager.BindCommand("/ai",      "ai.admin",     Handle_AI_Command,   " ~ Perform AI Admin Function.")
  --
  -- Event Hooks
  --
  cPluginManager:AddHook(cPluginManager.HOOK_WORLD_TICK,   AI_OnWorldTick)
  --
  -- Report successful start
  -- 
  LOG("[AI] Enabling Intelligence " .. Plugin:GetName() .. " v." .. Plugin:GetVersion() )
  return true
end

function OnDisable()
  if (DisablePlugin) then -- if the plugin has to be reloaded then load the plugin again ;)
    LOGINFO("[AI] Intelligence is reloading")
    PluginManager:LoadPlugin("AI")
  else
    LOG("[AI] Disabling Intelligence")
  end
end