local config = {
	boss = {
		name = "Bakragore",
		position = Position(34227, 31996, 14),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(34260, 31997, 14), teleport = Position(34224, 31990, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34261, 31997, 14), teleport = Position(34224, 31990, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34262, 31997, 14), teleport = Position(34224, 31990, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34263, 31997, 14), teleport = Position(34224, 31990, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34264, 31997, 14), teleport = Position(34224, 31990, 14), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(34218, 31987, 14),
		to = Position(34238, 32005, 14),
	},
	exit = Position(34160, 32020, 14),
}

local lever = BossLever(config)
lever:position(Position(34259, 31997, 14))
lever:register()
