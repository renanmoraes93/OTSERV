local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setArea(createCombatArea(AREA_CIRCLE5X5))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 10)
	local max = (level / 5) + (maglevel * 14)
	local increasedMin = min * 1.4
    	local increasedMax = max * 1.4
    	return -increasedMin, -increasedMax
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:group("attack", "focus")
spell:id(24)
spell:name("Hell's Core")
spell:words("exevo gran mas flam")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_HELL_SCORE)
spell:level(60)
spell:mana(1100)
spell:isSelfTarget(true)
spell:isPremium(true)
spell:cooldown(15 * 1000)
spell:groupCooldown(3 * 1000, 3 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
