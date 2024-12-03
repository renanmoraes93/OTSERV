local condition = Condition(CONDITION_OUTFIT)
condition:setOutfit({ lookType = 1593 }) -- Avatar of Steel lookType

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	if not creature or not creature:isPlayer() then
		return false
	end

	local grade = creature:revelationStageWOD("Avatar of Steel")
	if grade == 0 then
		creature:sendCancelMessage("You cannot cast this spell")
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local cooldown = 0
	if grade >= 3 then
		cooldown = 60
	elseif grade >= 2 then
		cooldown = 90
	elseif grade >= 1 then
		cooldown = 120
	end
	local duration = 15000
	condition:setTicks(duration)
	local conditionCooldown = Condition(CONDITION_SPELLCOOLDOWN, CONDITIONID_DEFAULT, 264)	
	-- creature:getPosition():sendMagicEffect(CONST_ME_AVATAR_APPEAR)
	-- CHECK SANGUINE LEGS
	local legs = creature:getSlotItem(CONST_SLOT_LEGS)
	if legs and legs:getId() == 43876 then
	conditionCooldown:setTicks(((cooldown * 1000 * 60) - 1800000) / configManager.getFloat(configKeys.RATE_SPELL_COOLDOWN))
		else
	conditionCooldown:setTicks((cooldown * 1000 * 60) / configManager.getFloat(configKeys.RATE_SPELL_COOLDOWN))
		end
	creature:addCondition(conditionCooldown)
	creature:addCondition(condition)
	creature:avatarTimer((os.time() * 1000) + duration)
	creature:reloadData()
	addEvent(ReloadDataEvent, duration, creature:getId())
	return true
end

spell:group("support")
spell:id(264)
spell:name("Avatar of Steel")
spell:words("uteta res eq")
spell:level(1)
spell:mana(800)
spell:isPremium(true)
spell:cooldown(1000) -- Cooldown is calculated on the casting
spell:groupCooldown(2 * 1000)
spell:vocation("knight;true", "elite knight;true")
spell:hasParams(true)
spell:isAggressive(false)
spell:needLearn(true)
spell:register()
