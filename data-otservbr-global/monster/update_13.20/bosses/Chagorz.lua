local mType = Game.createMonsterType("Chagorz")
local monster = {}

monster.description = "Chagorz"
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
monster.corpse = 44024
monster.speed = 250
monster.manaCost = 0

monster.changeTarget = {
	interval = 10000,
	chance = 20
}

monster.bosstiary = {
	bossRaceId = 2366,
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

--0-98 Crystal Coins*,
--0-147 Ultimate Mana Potions,
--0-83 Ultimate Spirit Potions,
--0-39 Berserk Potions,
--0-29 Mastermind Potions,
--0-1 Gold Ingot,
--0-1 Green Gem,
--0-4 Yellow Gem.
--Raro:
--Chagorz Igneous Obsidian, 0-2 Giant Amethyst.*
----Muito Raro:
--Spiritual Horseshoe.

monster.loot = {
    { name = "crystal coin", chance = 7480, maxCount = 165 },
    { name = "giant amethyst", chance = 5970, maxCount = 10 },
    { name = "mastermind potion", chance = 8938, maxCount = 1 },
    { name = "berserk potion", chance = 8938, maxCount = 90 },
    { name = "ultimate mana potion", chance = 8938, maxCount = 147 },
    { name = "ultimate spirit potion", chance = 8938, maxCount = 83 },
    { name = "yellow gem", chance = 9985, maxCount = 4 },
    { name = "green gem", chance = 9985, maxCount = 1 },
    { name = "gold ingot", chance = 9985, maxCount = 1 },
    { id = 43966, chance = 1500 }, -- Chagorz igneous obsidian
    { id = 43895, chance = 160 }, -- Bag you covet
    { id = 44048, chance = 360 }, -- spiritual horseshoe
    { name = "tainted heart", chance = 1000},
    { name = "darklight heart", chance = 1000},
}

monster.attacks = {
	{ name ="melee", interval = 2000, chance = 100, minDamage = -1300, maxDamage = -2250 },
	{ name ="combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -500, maxDamage = -900, radius = 4, effect = CONST_ME_GREEN_RINGS, target = false },
	{ name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -500, maxDamage = -900, range = 4, radius = 4, effect = 241, target = true },
	{ name ="combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -1000, maxDamage = -1200, length = 10, spread = 3, effect = CONST_ME_POFF, target = false },
	{ name ="combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -1500, maxDamage = -1900, length = 10, spread = 3, effect = 225, target = false },
	{ name ="speed", interval = 2000, chance = 20, speedChange = -600, radius = 7, effect = CONST_ME_MAGIC_GREEN, target = false, duration = 20000 },
}

monster.defenses = {
	defense = 105,
	armor = 105,
	{ name ="combat", interval = 3000, chance = 10, type = COMBAT_HEALING, minDamage = 700, maxDamage = 1500, effect = 236, target = false },
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
	{ type = COMBAT_HOLYDAMAGE , percent = 15 },
	{ type = COMBAT_DEATHDAMAGE , percent = 15 }
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false }
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