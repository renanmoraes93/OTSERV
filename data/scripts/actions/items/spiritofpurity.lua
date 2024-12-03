local mountId = 217 -- ID da montaria que você deseja conceder
local message = "You receive the permission to ride a Spirit of Purity"

local requiredItems = {
    {itemId = 44048, count = 4}, -- ID spiritual horseshoe
}

local SpiritMount = Action()

-- Função para verificar se o jogador tem os itens necessários
local function hasRequiredItems(player)
    for _, requiredItem in ipairs(requiredItems) do
        if player:getItemCount(requiredItem.itemId) < requiredItem.count then
            return false
        end
    end
    return true
end

-- Função chamada quando a ação é usada
function SpiritMount.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Verifica se o jogador já possui a montaria
    if player:hasMount(mountId) then
        player:sendCancelMessage("You already have this mount.")
        return true
    end

    -- Verifica se o jogador possui os itens necessários
    if not hasRequiredItems(player) then
        player:sendCancelMessage("You do not have the required items.")
        return true
    end

    -- Remove os itens necessários do jogador
    for _, requiredItem in ipairs(requiredItems) do
        player:removeItem(requiredItem.itemId, requiredItem.count)
    end

    -- Concede a montaria ao jogador
    player:addMount(mountId)
    player:say(message, TALKTYPE_MONSTER_SAY)

    return true
end

-- Define o ID do item que aciona a ação
SpiritMount:id(44048)
-- Registra a ação
SpiritMount:register()
