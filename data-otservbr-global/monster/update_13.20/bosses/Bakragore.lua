local mType = Game.createMonsterType("Bakragore")
local monster = {}

monster.description = "Bakragore"
monster.experience = 550000
monster.outfit = {
    lookType = 1671,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0,
}

monster.events = {
    "bakragoredeath",
}

monster.health = 660000
monster.maxHealth = 660000
monster.race = "undead"
monster.corpse = 44012
monster.speed = 250
monster.manaCost = 0

monster.changeTarget = {
    interval = 10000,
    chance = 20,
}

monster.bosstiary = {
    bossRaceId = 2367,
    bossRace = RARITY_NEMESIS,
}

monster.strategiesTarget = {
    nearest = 70,
    health = 10,
    damage = 10,
    random = 10,
}

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    convinceable = false,
    pushable = false,
    rewardBoss = true,
    illusionable = false,
    canPushItems = true,
    canPushCreatures = true,
    staticAttackChance = 98,
    targetDistance = 1,
    runHealth = 0,
    healthHidden = false,
    isBlockable = false,
    canWalkOnEnergy = true,
    canWalkOnFire = true,
    canWalkOnPoison = true,
}

monster.light = {
    level = 0,
    color = 0,
}

monster.summon = {}

monster.voices = {}

monster.loot = {
    { name = "crystal coin", chance = 7480, maxCount = 165 },
    { name = "giant amethyst", chance = 5970, maxCount = 10 },
    { name = "giant Emerald", chance = 5970, maxCount = 10 },
    { name = "giant Ruby", chance = 5970, maxCount = 10 },
    { name = "giant Sapphire", chance = 5970, maxCount = 10 },
    { name = "giant topaz", chance = 5395, maxCount = 10 },
    { name = "mastermind potion", chance = 8938, maxCount = 30 },
    { name = "berserk potion", chance = 8938, maxCount = 90 },
    { name = "supreme health potion", chance = 8938, maxCount = 300 },
    { name = "ultimate mana potion", chance = 8938, maxCount = 300 },
    { name = "ultimate spirit potion", chance = 8938, maxCount = 300 },
    { name = "yellow gem", chance = 9985, maxCount = 10 },
    { name = "blue gem", chance = 9985, maxCount = 10 },
    { id = 3039, chance = 9985, maxCount = 10 },
    { name = "violet gem", chance = 9985, maxCount = 10 },
    { id = 43968, chance = 1500 }, -- Bakragore's Amalgamation
    { id = 43961, chance = 1500 }, -- darklight figurine
    { id = 30053, chance = 1500 }, -- dragon figurine
    { id = 39040, chance = 1500 }, -- fiery tier
    { id = 43895, chance = 260 }, -- Bag you covet
    { id = 44048, chance = 360 }, -- spiritual horseshoe
    { name = "tainted heart", chance = 1000},
    { name = "darklight heart", chance = 1000},

}

monster.attacks = {
    { name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -4500 },
    { name = "combat", interval = 3000, chance = 35, type = COMBAT_ICEDAMAGE, minDamage = -1900, maxDamage = -3100, range = 7, radius = 7, shootEffect = CONST_ANI_ICE, effect = 243, target = true },
    { name = "combat", interval = 2000, chance = 13, type = COMBAT_DEATHDAMAGE, minDamage = -1100, maxDamage = -2000, length = 8, spread = 0, effect = 252, target = false },
    { name = "combat", interval = 3000, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -2000, maxDamage = -3000, length = 8, spread = 0, effect = 249, target = false },
    { name = "combat", interval = 2000, chance = 30, type = COMBAT_ICEDAMAGE, minDamage = -1950, maxDamage = -3400, range = 7, radius = 3, shootEffect = 37, effect = 240, target = true },
    { name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -2000, maxDamage = -3500, length = 8, spread = 0, effect = 244, target = false },
}

monster.defenses = {
    defense = 135,
    armor = 135,
    { name = "combat", interval = 3000, chance = 15, type = COMBAT_HEALING, minDamage = 2500, maxDamage = 3500, effect = 236, target = false },
    { name = "speed", interval = 4000, chance = 80, speedChange = 700, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000 },
}

monster.elements = {
    { type = COMBAT_PHYSICALDAMAGE, percent = 15 },
    { type = COMBAT_ENERGYDAMAGE, percent = 15 },
    { type = COMBAT_EARTHDAMAGE, percent = 15 },
    { type = COMBAT_FIREDAMAGE, percent = 15 },
    { type = COMBAT_LIFEDRAIN, percent = 0 },
    { type = COMBAT_MANADRAIN, percent = 0 },
    { type = COMBAT_DROWNDAMAGE, percent = 0 },
    { type = COMBAT_ICEDAMAGE, percent = 15 },
    { type = COMBAT_HOLYDAMAGE, percent = 15 },
    { type = COMBAT_DEATHDAMAGE, percent = 15 },
}

monster.immunities = {
    { type = "paralyze", condition = true },
    { type = "outfit", condition = false },
    { type = "invisible", condition = true },
    { type = "bleed", condition = false },
}

mType.onThink = function(monster, interval) end

mType.onAppear = function(monster, creature)
    if monster:getType():isRewardBoss() then
        monster:setReward(true)
    end
end

mType.onDisappear = function(monster, creature) end

mType.onMove = function(monster, creature, fromPosition, toPosition) end

mType.onSay = function(monster, creature, type, message) end

mType:register(monster)
