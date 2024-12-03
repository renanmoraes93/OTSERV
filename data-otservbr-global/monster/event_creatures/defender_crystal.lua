local mType = Game.createMonsterType("Defender Crystal")
local monster = {}

monster.description = "Defender Crystal"
monster.experience = 40
monster.outfit = {
	lookType = 1731,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 26


monster.health = 19000
monster.maxHealth = 19000
monster.race = "undead"
monster.corpse = 0
monster.speed = 300
monster.manaCost = 305
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 0
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.events = {
	"CastleWar"
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	 
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
	{ name ="melee", interval = 2000, chance = 100, minDamage = -1300, maxDamage = -2250 },
	{ name ="combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -500, maxDamage = -900, radius = 4, effect = CONST_ME_GREEN_RINGS, target = false },
	{ name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -500, maxDamage = -900, range = 4, radius = 4, effect = 241, target = true },
	{ name ="combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -1000, maxDamage = -1200, length = 10, spread = 3, effect = CONST_ME_POFF, target = false },
	{ name ="combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -1500, maxDamage = -1900, length = 10, spread = 3, effect = 225, target = false },
	{ name ="speed", interval = 2000, chance = 20, speedChange = -600, radius = 7, effect = CONST_ME_MAGIC_GREEN, target = false, duration = 20000 },
}

monster.defenses = {
	defense = 10,
	armor = 10
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType.onThink = function(monster, interval)
	
end

mType:register(monster)
