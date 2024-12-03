local mType = Game.createMonsterType("Jogador de pedra")
local monster = {}

monster.description = "a jogador de pedra"
monster.experience = 40
monster.outfit = {
	lookTypeEx = 8201,
}

monster.raceId = 26


monster.health = 10000
monster.maxHealth = 10000
monster.race = "undead"
monster.corpse = 0
monster.speed = 0
monster.manaCost = 305
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 0
}

monster.strategiesTarget = {
	nearest = 100,
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
	{name ="combat", interval = 3000, chance = 100, type = COMBAT_LIFEDRAIN, minDamage = -300, maxDamage = -490, length = 8, spread = 0, effect = CONST_ANI_SMALLSTONE, target = false},
	{name ="combat", interval = 4000, chance = 80, type = COMBAT_PHYSICALDAMAGE, minDamage = -300, maxDamage = -1000, range = 10, radius = 8, shootEffect = CONST_ANI_SMALLSTONE, effect = CONST_ME_NONE, target = true},
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
