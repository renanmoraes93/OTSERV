function Position:sendAnimatedText(message)
    local specs = Game.getSpectators(self, false, true, 9, 9, 8, 8)
    if #specs > 0 then
        for i = 1, #specs do
            local player = specs[i]
            player:say(message, TALKTYPE_MONSTER_SAY, false, player, self)
        end
    end
end

local function showTimeMW(position)

    local item = Tile(position):getItemById(ITEM_MAGICWALL)
    if item then
        position:sendAnimatedText(math.ceil(item:getDuration() / 1000), TALKTYPE_MONSTER_SAY)
    end

    addEvent(showTimeMW, 1000, position)
end

function onCreateMagicWall(creature, tile)
    local magicWall
    if Game.getWorldType() == WORLD_TYPE_NO_PVP then
        magicWall = ITEM_MAGICWALL_SAFE
    else
        magicWall = ITEM_MAGICWALL
    end
    local item = Game.createItem(magicWall, 1, tile)
    local duration = math.random(16, 24)
    item:setDuration(duration)
    if item then
        showTimeMW(item:getPosition(), duration)
    end
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
combat:setCallback(CALLBACK_PARAM_TARGETTILE, "onCreateMagicWall")

local spell = Spell("rune")
function spell.onCastSpell(creature, variant, isHotkey)
    return combat:execute(creature, variant)
end

spell:id(206)
spell:name("Magic Wall Rune")
spell:group("attack")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
spell:impactSound(SOUND_EFFECT_TYPE_SPELL_MAGIC_WALL_RUNE)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(32)
spell:magicLevel(9)
spell:runeId(45035)
spell:charges(3)
spell:isBlocking(true, true)
spell:allowFarUse(true)
spell:register()