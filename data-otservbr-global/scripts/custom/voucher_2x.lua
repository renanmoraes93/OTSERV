local BONUS_TIMES = {
    [45220] = 60 * 60,   -- 1 hora
    [45221] = 3 * 60 * 60,  -- 3 horas
    [45222] = 6 * 60 * 60, -- 6 horas
    [45223] = 12 * 60 * 60  -- 12 horas
}

local voucher = Action()

-- Função para aplicar o bônus de XP e aumentar o tempo de boost
function applyXPBoost(player, bonusDuration)
    local currentBoostTime = player:getXpBoostTime() or 0
    local newBoostTime = currentBoostTime + bonusDuration
    player:setXpBoostTime(newBoostTime)

    local currentBoostPercent = player:getXpBoostPercent() or 0
    local newBoostPercent = currentBoostPercent + 100
    player:setXpBoostPercent(newBoostPercent)

    player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "Voce ativou o bonus de XP por " .. (bonusDuration / 3600) .. " horas.")
end

function voucher.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local itemId = item:getId()
    local bonusDuration = BONUS_TIMES[itemId]

    if bonusDuration then
        if not player:getItemById(itemId, true) then
            player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "O item deve estar no seu inventario para ser usado.")
            return true
        end

        local currentBoostTime = player:getXpBoostTime() or 0
        if currentBoostTime > 0 then
            player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "Voce ja tem um bonus de XP ativo.")
        else
            applyXPBoost(player, bonusDuration)
            player:removeItem(itemId, 1)
        end
    end
    return true
end

for itemId, _ in pairs(BONUS_TIMES) do
    voucher:id(itemId)
end

voucher:register()

-- Evento onLogin para garantir que o bônus ainda esteja ativo quando o jogador fizer login
function onLogin(player)
    local currentBoostTime = player:getXpBoostTime() or 0
    if currentBoostTime > 0 then
        player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "O bonus de XP ainda esta ativo.")
    else
        local defaultBoostPercent = 0
        player:setXpBoostPercent(defaultBoostPercent)
    end
end

registerCreatureEvent("onLogin", onLogin)

-- Evento global para verificar a expiração do bônus
local xpBonusEvent = GlobalEvent("CheckXpBonus")

function xpBonusEvent.onThink(interval)
    local players = Game.getPlayers()
    for _, player in pairs(players) do
        local currentBoostTime = player:getXpBoostTime() or 0
        if currentBoostTime > 0 then
            local position = player:getPosition()
            position:sendMagicEffect(260)
            player:say("boosted", TALKTYPE_MONSTER_SAY, false, nil, position)
        elseif currentBoostTime <= 0 then
            local defaultBoostPercent = 0
            player:setXpBoostPercent(defaultBoostPercent)
            player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "O bonus de XP expirou.")
        end
    end
    return true
end

xpBonusEvent:interval(60000) -- Verificação a cada 60 segundos
xpBonusEvent:register()
