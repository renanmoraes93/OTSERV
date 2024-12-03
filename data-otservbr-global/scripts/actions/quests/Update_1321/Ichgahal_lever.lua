local config = {
	boss = {
		name = "Ichgahal",
		position = Position(34228, 32022, 14),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(34260, 32023, 14), teleport = Position(34226, 32016, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34261, 32023, 14), teleport = Position(34226, 32016, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34262, 32023, 14), teleport = Position(34226, 32016, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34263, 32023, 14), teleport = Position(34226, 32016, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34264, 32023, 14), teleport = Position(34226, 32016, 14), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(34217, 32013, 14),
		to = Position(34237, 32031, 14),
	},
	exit = Position(34257, 32020, 14),
}

local lever = BossLever(config)
lever:position(Position(34259, 32023, 14))
lever:register()
