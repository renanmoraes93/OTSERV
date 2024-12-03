local checkBonusCommand = TalkAction("!bonus")

function checkBonusCommand.onSay(player, words, param)
    -- Obtem os valores atuais
    local xpBoostTime = player:getXpBoostTime() or 0
    local hoursLeft = math.floor(xpBoostTime / 3600)
    local minutesLeft = math.floor((xpBoostTime % 3600) / 60)
    local xpBoostPercent = player:getXpBoostPercent() or 0
    local staminaBonusXp = player:getFinalBonusStamina() or 1
    local baseRateExp = player:getFinalBaseRateExperience() or 1

    -- Exibe os valores para o jogador
    local message = ""
    if xpBoostTime > 0 then
        message = "Tempo restante do bonus de XP: " .. hoursLeft .. " hora(s) e " .. minutesLeft .. " minutos.\n"
        message = message .. "XP Boost Percent: " .. xpBoostPercent .. "%\n"
        message = message .. "Bonus de Stamina: " .. staminaBonusXp .. "x\n"
        message = message .. "Taxa Base de XP: " .. baseRateExp .. "x\n"

        -- Calcula o valor final de experiencia
        local finalExpMultiplier = (1 + xpBoostPercent / 100) * staminaBonusXp * baseRateExp
        message = message .. "Multiplicador final de experiencia: " .. finalExpMultiplier .. "x"
    else
        message = "Voce nao tem nenhum bonus de XP ativo no momento."
    end

    player:showTextDialog(2175, message)
    return true
end

checkBonusCommand:groupType("normal")
checkBonusCommand:register()
