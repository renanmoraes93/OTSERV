local mType = Game.createMonsterType("Silencer Castle")
local monster = {}

monster.description = "a silencer"
monster.experience = 5100
monster.outfit = {
	lookType = 585,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 1014

monster.health = 8400
monster.maxHealth = 8400
monster.race = "blood"
monster.corpse = 20155
monster.speed = 670
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 5
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Prrrroooaaaah!!! PRROAAAH!!", yell = false},
	{text = "PRRRROOOOOAAAAAHHHH!!!", yell = false},
	{text = "HUUUSSSSSSSSH!!", yell = false},
	{text = "Hussssssh!!", yell = false}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 120, maxDamage = -615, condition = {type = CONDITION_POISON, totalDamage = 600, interval = 4000}},
	{name ="silencer skill reducer", interval = 2000, chance = 20, range = 3, target = false},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_MANADRAIN, minDamage = -40, maxDamage = -450, radius = 4, shootEffect = CONST_ANI_ONYXARROW, effect = CONST_ME_MAGIC_RED, target = true}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="speed", interval = 2000, chance = 15, speedChange = 450, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 220, maxDamage = 425, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 5},
	{type = COMBAT_ENERGYDAMAGE, percent = 15},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 30},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 15},
	{type = COMBAT_HOLYDAMAGE , percent = -25},
	{type = COMBAT_DEATHDAMAGE , percent = 65}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
