local config = {
    topCount = 10,
    messageType = MESSAGE_EVENT_ADVANCE,
    interval = 30 * 60 * 1000 -- 1 minute interval
}

local currentTopType = 1
local topTypes = {
    { 'Level', function(player) return player:getLevel() end },
    { 'Magic Level', function(player) return player:getMagicLevel() end },
    { 'Sword', function(player) return player:getSkillLevel(SKILL_SWORD) end },
    { 'Club', function(player) return player:getSkillLevel(SKILL_CLUB) end },
    { 'Axe', function(player) return player:getSkillLevel(SKILL_AXE) end },
    { 'Distance', function(player) return player:getSkillLevel(SKILL_DISTANCE) end },
    { 'Shield', function(player) return player:getSkillLevel(SKILL_SHIELD) end }
    --{ 'Fish', function(player) return player:getSkillLevel(SKILL_FISH) end },
    --{ 'Fist', function(player) return player:getSkillLevel(SKILL_FIST) end }
}

local globalEvent = GlobalEvent("TopLevelOnline")
function globalEvent.onThink(interval)
    local type = topTypes[currentTopType]
    local getSkill = type[2]
    local types = #topTypes
    currentTopType = currentTopType % types + 1
    
    local onlineList = Game.getPlayers()
    local players = {}
    for _, targetPlayer in ipairs(onlineList) do
        if not targetPlayer:getGroup():getAccess() then
            table.insert(players, targetPlayer)
        end
    end
    
    local count = math.min(config.topCount, #players)
    if count > 0 then
        if count > 1 then
            table.sort(players, function(a, b) return getSkill(a) > getSkill(b) end)
        end
        local description = string.format("~ Top %d Online / %s ~\n\n", config.topCount, type[1])
        for i = 1, count do
            local p = players[i]
            description = string.format("%s%d) %s - %d%s", description, i, p:getName(), getSkill(p), (i == count and "" or "\n"))
        end
        broadcastMessage(description, config.messageType)
    end
    return true
end

globalEvent:interval(config.interval)
globalEvent:register()
