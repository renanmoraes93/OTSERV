local config = {
    boss = { name = "Timira the Many-Headed" },
    encounter = "Timira the Many-Headed",
    requiredLevel = 250,
    playerPositions = {
        { pos = Position(33809, 32702, 8), teleport = Position(33815, 32703, 9), effect = CONST_ME_TELEPORT },
        { pos = Position(33808, 32702, 8), teleport = Position(33815, 32703, 9), effect = CONST_ME_TELEPORT },
        { pos = Position(33807, 32702, 8), teleport = Position(33815, 32703, 9), effect = CONST_ME_TELEPORT },
        { pos = Position(33806, 32702, 8), teleport = Position(33815, 32703, 9), effect = CONST_ME_TELEPORT },
        { pos = Position(33805, 32702, 8), teleport = Position(33815, 32703, 9), effect = CONST_ME_TELEPORT },
    },
    specPos = {
        from = Position(33803, 32690, 9),
        to = Position(33828, 32715, 9),
    },
    exit = Position(33810, 32699, 8),
}

local lever = BossLever(config)
lever:position({ x = 33810, y = 32702, z = 8 })
lever:register()

local zone = lever:getZone()
zone:addArea({ x = 33803, y = 32690, z = 9 }, { x = 33828, y = 32715, z = 9 }) -- Boss area only
