local water = {490, 491, 492, 493, 4608, 4609, 4610, 4611, 4612, 4613, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625}

local combat = Combat()
local meteor = Combat()
meteor:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
meteor:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
meteor:setFormula(COMBAT_FORMULA_LEVELMAGIC, -1.3, -20, -1.50, -24)

local meteor_water = Combat()
meteor_water:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
meteor_water:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
meteor_water:setFormula(COMBAT_FORMULA_LEVELMAGIC, -1.3, -20, -1.50, -24)

local combat_arr = {
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

local combat_area = createCombatArea(combat_arr)
combat:setArea(combat_area)

local function meteorCast(p)
    p.combat:execute(p.cid, positionToVariant(p.pos))
end

function onTargetTile(cid, pos)
    if (math.random(0, 0) == 0) then
        local ground = getThingfromPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 1})
        local newpos = {x = pos.x + 9, y = pos.y - 8, z = pos.z}  -- Alterar para vir da direita
        doSendDistanceShoot(newpos, pos, CONST_ANI_ICE)
        if (isInArray(water, ground.itemid)) then
            addEvent(meteorCast, 100, {cid = cid, pos = pos, combat = meteor_water})
        else
            addEvent(meteorCast, 100, {cid = cid, pos = pos, combat = meteor})
        end
    end
end

combat:setCallback(CALLBACK_PARAM_TARGETTILE, "onTargetTile")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
    return combat:execute(creature, variant)
end

spell:group("attack")
spell:id(88)
spell:name("Mas Frigo")
spell:words("exori mas frigo")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
spell:impactSound(SOUND_EFFECT_TYPE_SPELL_ICE_STRIKE)
spell:level(150)
spell:mana(1500)
spell:range(6)
spell:isPremium(true)
spell:needTarget(true)
spell:blockWalls(true)
spell:cooldown(3 * 1000)
spell:groupCooldown(3 * 1000)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true")
spell:register()
