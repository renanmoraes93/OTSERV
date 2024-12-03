local config = {
    centerPosition = Position(34227, 31996, 14), -- Center Room  
    rangeX = 11,
    rangeY = 11,
}

local BakragoreDeath = CreatureEvent("bakragoredeath")
local removeMonsters = false

function BakragoreDeath.onPrepareDeath(creature)
    local spectators = Game.getSpectators(config.centerPosition, false, false, config.rangeX, config.rangeX, config.rangeY, config.rangeY)
    for _, cid in pairs(spectators) do
        if removeMonsters and cid:isMonster() and not cid:getMaster() then
            cid:remove()
        elseif cid:isPlayer() then
            if cid:getStorageValue(99990002) == -1 then
                cid:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations you won a special outfit.")
                cid:addOutfit(1663, 0)
                cid:addOutfit(1662, 0)
                cid:setStorageValue(99990002, 1)
            end
        end
    end

    return true
end

BakragoreDeath:register()
