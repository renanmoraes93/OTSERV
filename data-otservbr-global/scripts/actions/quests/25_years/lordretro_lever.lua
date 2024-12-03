local config = {
	boss = {
		name = "Lord Retro",
		position = Position(33578, 31015, 15),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(33516, 31055, 15), teleport = Position(33579, 31027, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33517, 31055, 15), teleport = Position(33579, 31027, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33518, 31055, 15), teleport = Position(33579, 31027, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33519, 31055, 15), teleport = Position(33579, 31027, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33520, 31055, 15), teleport = Position(33579, 31027, 15), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(33578, 31009, 15),
		to = Position(33577, 31031, 15),
	},
	exit = Position(33891, 31197, 7),
}

local lever = BossLever(config)
lever:position(Position(33515, 31055, 15))
lever:register()
