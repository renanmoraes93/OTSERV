local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000) -- 10 minutos
condition:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 115) -- 15% a mais de vida

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
    local position = creature:getPosition()

    local party = creature:getParty()
    local guild = creature:getGuild()
    if not party and not guild then
        creature:sendCancelMessage("No party or guild members in range.")
        position:sendMagicEffect(CONST_ME_POFF)
        return false
    end

    local membersList = {}
    if party then
        for _, member in ipairs(party:getMembers()) do
            table.insert(membersList, member)
        end
        table.insert(membersList, party:getLeader())
    end

    if guild then
        local spectators = Game.getSpectators(position, false, true, 7, 7, 5, 5)
        for _, spectator in ipairs(spectators) do
            if spectator:isPlayer() and spectator:getGuild() == guild and not table.contains(membersList, spectator) then
                table.insert(membersList, spectator)
            end
        end
    end

    if #membersList <= 1 then
        creature:sendCancelMessage("No party or guild members in range.")
        position:sendMagicEffect(CONST_ME_POFF)
        return false
    end

    local affectedList = {}
    for _, targetPlayer in ipairs(membersList) do
        if targetPlayer:getPosition():getDistance(position) <= 36 then
            table.insert(affectedList, targetPlayer)
        end
    end

    if #affectedList <= 1 then
        creature:sendCancelMessage("No party or guild members in range.")
        position:sendMagicEffect(CONST_ME_POFF)
        return false
    end

    local baseMana = 100
    local mana = math.ceil((0.9 ^ (#affectedList - 1) * baseMana) * #affectedList)
    if creature:getMana() < mana then
        creature:sendCancelMessage(RETURNVALUE_NOTENOUGHMANA)
        position:sendMagicEffect(CONST_ME_POFF)
        return false
    end

    creature:addMana(-(mana - baseMana), false)
    creature:addManaSpent((mana - baseMana))

    for _, targetPlayer in ipairs(affectedList) do
        targetPlayer:addCondition(condition)
        targetPlayer:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    end

    return true
end

spell:name("Life Blessing")
spell:words("vita gran mas sio")
spell:group("support")
spell:vocation("druid;true", "elder druid;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_HEAL_FRIEND)
spell:id(130)
spell:cooldown(3000)
spell:groupCooldown(1000)
spell:level(24)
spell:mana(1500)
spell:needTarget(false)
spell:isAggressive(false)
spell:isPremium(true)
spell:register()
