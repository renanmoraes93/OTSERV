local config = {
	boss = {
		name = "Vemiath",
		position = Position(34196, 32051, 14),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(34162, 32051, 14), teleport = Position(34194, 32045, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34163, 32051, 14), teleport = Position(34194, 32045, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34164, 32051, 14), teleport = Position(34194, 32045, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34165, 32051, 14), teleport = Position(34194, 32045, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34166, 32051, 14), teleport = Position(34194, 32045, 14), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(34186, 32042, 14),
		to = Position(34208, 32061, 14),
	},
	exit = Position(34160, 32048, 14),
}

local lever = BossLever(config)
lever:position(Position(34161, 32051, 14))
lever:register()
