local config = {
    max = 4,
    maxVip = 4,
    text = "Only 3 (FREE) & 4 (VIP) characters allowed per IP.",
    group_id = 1,  -- it applies the limit to players with a group less than or equal to the id
    milliseconds_before_kick_to_read_popup = 9000 -- 9000 = 9 seconds
}
local accepted_ip_list = {}  -- here put the IPs you want to be allowed to use MC/Magebomb..

function delayedKickPlayerMCLimit(playerId)
    local player = Player(playerId)
    if player then
        player:remove()
    end
end

local antimc = CreatureEvent("AntiMC")

function antimc.onLogin(player)
    if player:getGroup():getId() <= config.group_id then
        if not isInArray(accepted_ip_list, Game.convertIpToString(player:getIp())) then
            if #getPlayersByIPAddress(player:getIp()) > config.max then
                addEvent(delayedKickPlayerMCLimit, config.milliseconds_before_kick_to_read_popup, player:getId())
            end
        else
            if #getPlayersByIPAddress(player:getIp()) > config.maxVip then
                addEvent(delayedKickPlayerMCLimit, config.milliseconds_before_kick_to_read_popup, player:getId())
            end    
        end
    end
    return true
end

antimc:register()
