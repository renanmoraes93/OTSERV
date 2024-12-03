local config = {
	boss = {
		name = "Brain Head",
		position = Position(31954, 32325, 10)
	},
	{
			name = "Cerebellum",
			positions = {
				Position(31953, 32324, 10),
				Position(31955, 32324, 10),
				Position(31953, 32326, 10),
				Position(31955, 32326, 10),
				Position(31960, 32320, 10),
				Position(31960, 32330, 10),
				Position(31947, 32320, 10),
				Position(31947, 32330, 10),
			},
		},
	requiredLevel = 150,

	playerPositions = {
		{pos = Position(32004, 32326, 10), teleport = Position(31956, 32335, 10), effect = CONST_ME_TELEPORT},
		{pos = Position(32005, 32326, 10), teleport = Position(31956, 32335, 10), effect = CONST_ME_TELEPORT},
		{pos = Position(32006, 32326, 10), teleport = Position(31956, 32335, 10), effect = CONST_ME_TELEPORT},
		{pos = Position(32007, 32326, 10), teleport = Position(31956, 32335, 10), effect = CONST_ME_TELEPORT},
		{pos = Position(32008, 32326, 10), teleport = Position(31956, 32335, 10), effect = CONST_ME_TELEPORT}
	},
	specPos = {
		from = Position(31954, 32312, 10),
		to = Position(31953, 32338, 10)
	},
	exit = Position(32011, 32323, 10),
}

local lever = BossLever(config)
lever:position({x = 32003, y = 32326, z = 10})
lever:register()
