local mType = Game.createMonsterType("Hand of Cursed Fate Castle")
local monster = {}

monster.description = "a hand of cursed fate"
monster.experience = 0
monster.outfit = {
	lookType = 230,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 281

monster.health = 12500
monster.maxHealth = 12500
monster.race = "blood"
monster.corpse = 6311
monster.speed = 260
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 20,
	targetDistance = 1,
	runHealth = 3500,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
}


monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 100, maxDamage = -820, condition = {type = CONDITION_POISON, totalDamage = 380, interval = 4000}},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_MANADRAIN, minDamage = 100, maxDamage = -920, range = 1, target = false},
	{name ="drunk", interval = 2000, chance = 10, radius = 4, effect = CONST_ME_SMALLCLOUDS, target = false, duration = 3000},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -220, maxDamage = -980, range = 1, effect = CONST_ME_SMALLCLOUDS, target = false}
}

monster.defenses = {
	defense = 25,
	armor = 25,
	{name ="speed", interval = 2000, chance = 15, speedChange = 1000, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000},
	{name ="invisible", interval = 2000, chance = 10, effect = CONST_ME_MAGIC_BLUE},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 100, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = -25},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
