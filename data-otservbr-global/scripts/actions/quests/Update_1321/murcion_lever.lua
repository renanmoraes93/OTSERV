local config = {
	boss = {
		name = "Murcion",
		position = Position(34195, 31986, 14),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(34165, 31988, 14), teleport = Position(34192, 31981, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34166, 31988, 14), teleport = Position(34192, 31981, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34167, 31988, 14), teleport = Position(34192, 31981, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34168, 31988, 14), teleport = Position(34192, 31981, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34169, 31988, 14), teleport = Position(34192, 31981, 14), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(34183, 31979, 14),
		to = Position(34207, 32001, 14),
	},
	exit = Position(34163, 31985, 14),
}

local lever = BossLever(config)
lever:position(Position(34164, 31988, 14))
lever:register()
