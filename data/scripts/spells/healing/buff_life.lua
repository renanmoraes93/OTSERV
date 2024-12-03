local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000) -- 10 minutos
condition:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 115) -- 15% mais de vida
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
combat:addCondition(condition)

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
    local target = Creature(variant:getNumber())
    if not target or not target:isPlayer() then
        creature:sendCancelMessage("You can only cast this spell on players.")
        return false
    end

    creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
    return combat:execute(creature, variant)
end

spell:name("Buff HP")
spell:words("vita gran sio")
spell:group("healing")
spell:vocation("druid;true", "elder druid;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_HEAL_FRIEND)
spell:id(84)
spell:cooldown(1000)
spell:groupCooldown(1000)
spell:level(100)
spell:mana(1200)
spell:needTarget(true)
spell:hasParams(true)
spell:hasPlayerNameParam(true)
spell:allowOnSelf(true)
spell:isAggressive(false)
spell:isPremium(true)
spell:register()
