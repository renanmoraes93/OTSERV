local mType = Game.createMonsterType("Parcel Castle")
local monster = {}

monster.description = "a parcel castle"
monster.experience = 160
monster.outfit = {
	lookTypeEx = 140,
}

monster.raceId = 67
monster.Bestiary = {
	class = "Construct",
	race = BESTY_RACE_CONSTRUCT,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Maze of Lost Souls, in and around Ashta daramai, Formorgar Mines, \z
		Mad Technomancer room, Dark Cathedral, Demona, Goroma, Tarpit Tomb, Peninsula Tomb, \z
		Deeper Banuta, Forbidden Lands, Beregar Mines, Farmine Mines, Drillworm Caves, 2 caves on Hrodmir, \z
		Orc Fortress (single spawn) and Medusa Tower."
	}

monster.health = 2700
monster.maxHealth = 2700
monster.race = "undead"
monster.corpse = 6005
monster.speed = 220
monster.manaCost = 590

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
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
}

monster.loot = {
	{name = "small stone", chance = 13890, maxCount = 4},
	{id = 12600, chance = 550}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 400, maxDamage = -910}
}

monster.defenses = {
	defense = 20,
	armor = 20
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 15},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 20}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType:register(monster)
