local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_REGENERATION)
condition:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000) -- 10 minutos
condition:setParameter(CONDITION_PARAM_HEALTHGAIN, 20)        -- 20 de vida
condition:setParameter(CONDITION_PARAM_HEALTHTICKS, 2 * 1000) -- a cada 2 segundos
condition:setParameter(CONDITION_PARAM_MANAGAIN, 20)          -- 20 de mana
condition:setParameter(CONDITION_PARAM_MANATICKS, 2 * 1000)  -- a cada 2 segundos
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

spell:name("Mana Vita Regen")
spell:words("utevo gran sio")
spell:group("support")
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_HEAL_FRIEND)
spell:id(133)
spell:cooldown(3000)          -- 1 segundo de cooldown
spell:groupCooldown(1000)     -- 1 segundo de cooldown para o grupo
spell:level(100)
spell:mana(1500)
spell:needTarget(true)
spell:hasParams(true)
spell:hasPlayerNameParam(true)
spell:allowOnSelf(true)
spell:isAggressive(false)
spell:isPremium(true)
spell:register()
