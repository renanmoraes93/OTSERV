local mType = Game.createMonsterType("Vemiath")
local monster = {}

monster.description = "Vemiath"
monster.experience = 180000
monster.outfit = {
    lookType = 1665,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 350000
monster.maxHealth = 350000
monster.race = "undead"
monster.corpse = 44021
monster.speed = 250
monster.manaCost = 0

monster.changeTarget = {
    interval = 10000,
    chance = 20
}

monster.bosstiary = {
    bossRaceId = 2365,
    bossRace = RARITY_NEMESIS
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
    canWalkOnPoison = true
}

monster.events = {
}

monster.light = {
    level = 0,
    color = 0
}

monster.summon = {
}

monster.voices = {
}


--Comum:
--0-86 Crystal Coins*,
--0-4 Blue Gem*,
--0-1 Red Gem*,
--0-44 Bullseye Potions*,
--0-34 Supreme Health Potions*,
--0-128 Ultimate Mana Potions*
--Semi-Raro:
--0-1 Giant Amethyst.*
--Raro:
--Darklight Figurine,
--Vemiath's Infused Basalt.
--Muito Raro:
--Spiritual Horseshoe.

monster.loot = {
    { name = "crystal coin", chance = 7480, maxCount = 86 },
    { name = "giant amethyst", chance = 5970, maxCount = 1 },
    { name = "mastermind potion", chance = 8938, maxCount = 15 },
    { name = "berserk potion", chance = 8938, maxCount = 15 },
    { name = "supreme health potion", chance = 8938, maxCount = 128 },
    { name = "ultimate mana potion", chance = 8938, maxCount = 128 },
    { name = "ultimate spirit potion", chance = 8938, maxCount = 129 },
    { name = "yellow gem", chance = 9985, maxCount = 4 },
    { name = "blue gem", chance = 9985, maxCount = 4 },
    { id = 3039, chance = 9985, maxCount = 4 },
    { name = "violet gem", chance = 9985, maxCount = 10 },
    { id = 43967, chance = 1500 }, -- Vemiath's infused basalt
    { id = 43961, chance = 1500 }, -- darklight figurine
    { id = 43895, chance = 160 }, -- Bag you covet
    { id = 44048, chance = 360 }, -- spiritual horseshoe
    { name = "tainted heart", chance = 1000},
    { name = "darklight heart", chance = 1000},
}

monster.attacks = {
    { name = "melee", interval = 2000, chance = 100, minDamage = -1500,         maxDamage = -2500 },
    { name = "combat", interval = 3000, chance = 20, type = COMBAT_FIREDAMAGE,  minDamage = -500, maxDamage = -1000,           length = 10,    spread = 3,      effect = 244,                   target = false },
    { name = "speed", interval = 2000, chance = 25,  speedChange = -600,        radius = 7,       effect = CONST_ME_MAGIC_RED, target = false, duration = 15000 },
    { name = "combat", interval = 2000, chance = 15, type = COMBAT_ICEDAMAGE,   minDamage = -300, maxDamage = -700,            radius = 5,     effect = 243,    target = false },
    { name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -500, maxDamage = -800,            length = 10,    spread = 3,      effect = CONST_ME_EXPLOSIONHIT, target = false },
    { name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE,  minDamage = -500, maxDamage = -800,            length = 8,     spread = 3,      effect = CONST_ME_FIREATTACK,   target = false }
}

monster.defenses = {
    defense = 105,
    armor = 105,
    { name = "combat", interval = 3000, chance = 10, type = COMBAT_HEALING, minDamage = 800, maxDamage = 1500, effect = 236, target = false },
}

monster.elements = {
    { type = COMBAT_PHYSICALDAMAGE, percent = 15 },
    { type = COMBAT_ENERGYDAMAGE,   percent = 15 },
    { type = COMBAT_EARTHDAMAGE,    percent = 15 },
    { type = COMBAT_FIREDAMAGE,     percent = 15 },
    { type = COMBAT_LIFEDRAIN,      percent = 0 },
    { type = COMBAT_MANADRAIN,      percent = 0 },
    { type = COMBAT_DROWNDAMAGE,    percent = 0 },
    { type = COMBAT_ICEDAMAGE,      percent = 15 },
    { type = COMBAT_HOLYDAMAGE,     percent = 15 },
    { type = COMBAT_DEATHDAMAGE,    percent = 15 }
}

monster.immunities = {
    { type = "paralyze",  condition = true },
    { type = "outfit",    condition = false },
    { type = "invisible", condition = true },
    { type = "bleed",     condition = false }
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
    if monster:getType():isRewardBoss() then
        monster:setReward(true)
    end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)
