local config = {
	boss = {
		name = "Chagorz",
		position = Position(34197, 32022, 14),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(34162, 32023, 14), teleport = Position(34197, 32016, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34163, 32023, 14), teleport = Position(34197, 32016, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34164, 32023, 14), teleport = Position(34197, 32016, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34165, 32023, 14), teleport = Position(34197, 32016, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34166, 32023, 14), teleport = Position(34197, 32016, 14), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(34184, 32013, 14),
		to = Position(34207, 32033, 14),
	},
	exit = Position(34160, 32020, 14),
}

local lever = BossLever(config)
lever:position(Position(34161, 32023, 14)) 
lever:register()
