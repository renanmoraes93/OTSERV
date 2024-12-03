local mType = Game.createMonsterType("Murcion")
local monster = {}

monster.description = "Murcion"
monster.experience = 180000
monster.outfit = {
    lookType = 1664,
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
monster.corpse = 44015
monster.speed = 250
monster.manaCost = 0

monster.changeTarget = {
    interval = 10000,
    chance = 20
}

monster.bosstiary = {
    bossRaceId = 2362,
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
--0-78 Crystal Coins,
--0-156 Supreme Health Potions,
--0-18 Ultimate Mana Potions,
--0-87 Ultimate Spirit Potions,
--0-16 Berserk Potions,
--Blue Gem,
--0-2 Green Gems,
--0-4 Red Gem,
--0-19 Mastermind Potions,
--Gold Ingot,
--White Gem.
--Semi-Raro:
--Amber with a Dragonfly,
--Giant Emerald.*
--Raro:
--Putrefactive Figurine,
--Murcion's Mycelium.
--Muito Raro:
--Bag You Covet, Spiritual Horseshoe.

monster.loot = {
    { name = "crystal coin", chance = 7480, maxCount = 78 },
    { name = "giant Emerald", chance = 5970, maxCount = 1 },
    { name = "mastermind potion", chance = 8938, maxCount = 19 },
    { name = "berserk potion", chance = 8938, maxCount = 16 },
    { name = "supreme health potion", chance = 8938, maxCount = 156 },
    { name = "ultimate mana potion", chance = 8938, maxCount = 156 },
    { name = "ultimate spirit potion", chance = 8938, maxCount = 156 },
    { name = "green gem", chance = 9985, maxCount = 2 },
    { name = "blue gem", chance = 9985, maxCount = 2 },
    { id = 3039, chance = 9985, maxCount = 2 },
    { name = "gold ingot", chance = 9985, maxCount = 1 },
    { id = 32625, chance = 4500 }, -- Amber with a Dragonfly
    { id = 43962, chance = 1500 }, -- Putrefactive Figurine
    { id = 43965, chance = 1500 }, -- Murcion's Mycelium
    { id = 43895, chance = 160 }, -- Bag you covet
    { id = 44048, chance = 360 }, -- spiritual horseshoe
    { name = "tainted heart", chance = 1000},
    { name = "darklight heart", chance = 1000},


}

monster.attacks = {
    { name = "melee",  interval = 2000, chance = 100, minDamage = -1400,            maxDamage = -2300 },
    { name = "combat", interval = 2000, chance = 20,  type = COMBAT_DEATHDAMAGE,    minDamage = -500,  maxDamage = -900,       radius = 4,     effect = CONST_ME_SMALLCLOUDS, target = false },
    { name = "combat", interval = 2000, chance = 20,  type = COMBAT_HOLYDAMAGE,     minDamage = -500,  maxDamage = -900,       range = 4,      radius = 4,                    shootEffect = 31, effect = 248,  target = true },
    { name = "combat", interval = 2000, chance = 20,  type = COMBAT_ICEDAMAGE,      minDamage = -1000, maxDamage = -1200,      length = 10,    spread = 3,                    effect = 53,      target = false },
    { name = "combat", interval = 2000, chance = 20,  type = COMBAT_PHYSICALDAMAGE, minDamage = -1500, maxDamage = -1900,      length = 10,    spread = 3,                    effect = 158,     target = false },
    { name = "speed",  interval = 2000, chance = 20,  speedChange = -600,           radius = 7,        effect = CONST_ME_POFF, target = false, duration = 20000 }
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
