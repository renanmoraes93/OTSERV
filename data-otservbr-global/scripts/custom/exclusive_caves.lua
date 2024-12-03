-- Revscript Exclusive Cave by Woox and luanluciano93 --

--[[
INSERT INTO `cave_exclusive` (`cave`, `owner`) VALUES
('7001', '0'), ('7002', '0'), ('7003', '0'), ('7004', '0'), ('7005', '0'), ('7006', '0'), ('7007', '0'), ('7008', '0'), ('7009', '0'), ('7010', '0'),
('7011', '0'), ('7012', '0'), ('7013', '0'), ('7014', '0'), ('7015', '0'), ('7016', '0'), ('7017', '0'), ('7018', '0'), ('7019', '0'), ('7020', '0'),
('7021', '0'), ('7022', '0'), ('7023', '0'), ('7024', '0'), ('7025', '0'), ('7026', '0'), ('7027', '0'), ('7028', '0'), ('7029', '0'), ('7030', '0'),
('7031', '0'), ('7032', '0'), ('7033', '0'), ('7034', '0'), ('7035', '0'), ('7036', '0'), ('7037', '0'), ('7038', '0'), ('7039', '0'), ('7040', '0');
]]--

-- LIB
local caveExclusiva = {
	config = {
		actionItemIDS = {45277, 45191, 45190, 45189, 45192}, -- KEY IDS definidos para comprar uma cave.
		actionIdTeleportExit = 8888,
		rentTime = { -- tempo que o jogador vai permanecer como dono de uma cave, o valor deve ser definido em segundos.
			[45277] = 1 * 60 * 60, -- 1hr - daily reward
			[45191] = 1 * 60 * 60, -- 1hr
			[45190] = 6 * 60 * 60, -- 6hrs
			[45189] = 12 * 60 * 60, -- 12hrs
			[45192] = 24 * 60 * 60, -- 24hrs
		},
		fullStaminaRestore = {
			[45277] = false, -- 1hr - daily reward
			[45191] = false, -- 1hr
			[45190] = true, -- 6hrs
			[45189] = true, -- 12hrs
			[45192] = true, -- 24hrs
		},
		buyItemID = {40250, 40417}, -- DOOR ID em que o jogador deve usar a KEY ID definida na actionItemIDS para comprar uma cave.
		caveStats = true, -- pode ser definido como true ou false, se definido como falso não irá permitir o uso da talkaction que exibe informações sobre as caves.
		buyMessage = "[CAVE EXCLUSIVE] You bought the %s cave for %s.", -- esta é a mensagem que irá aparecer quando o jogador comprar uma cave. | 1° [%s] = Variavel para nome da cave, 2° [%s] = Variavel para duração da cave
		timeLeftMessageInCave = "[CAVE EXCLUSIVE] Your time in the cave %s it's over and you've been teleported to the temple.", -- Mensagem quando acabar o tempo e o player estiver dentro da cave
		timeLeftMessage = "[CAVE EXCLUSIVE] Your time in the cave %s is over.", -- Mensagem quando acabar o tempo e o player estiver fora da cave
		signs = {
			useSigns = true, -- se definido como "true" irá exibir o dono e o tempo restante em um quadro ou qualquer item configurado na variável abaixo.
			signID = 2602, -- ID do item em que será exibido as informações da cave.
			signLook = "This cave belongs to %s, will be free again in %s." -- mensagem a ser exibida ao dar look no item definido na variável acima. | 1° [%s] = Variavel para nome do player, 2° [%s] = Variavel para horário em que estara livre novamente
		},
		positionExitCaves = Position(31358, 32381, 7),
	},

	caves = {
		[7001] = { caveName = "Grim Reapers", enterPos = Position(31491, 32794, 7), signPos = Position(31353, 32377, 7) },
		[7002] = { caveName = "Demons", enterPos = Position(31382, 32762, 7), signPos = Position(31356, 32377, 7) },
		[7003] = { caveName = "True Midnight Asura", enterPos = Position(31589, 32775, 7), signPos = Position(31359, 32377, 7) },
		[7004] = { caveName = "True Frost Flower Asura", enterPos = Position(31626, 32776, 7), signPos = Position(31362, 32377, 7) },
		[7005] = { caveName = "True Drawnfire Asura", enterPos = Position(31667, 32776, 7), signPos = Position(31365, 32377, 7) },
		[7006] = { caveName = "Crazed Summer Vanguard", enterPos = Position(31394, 32827, 7), signPos = Position(31368, 32377, 7) },
		[7007] = { caveName = "Crazed Winter Vanguard", enterPos = Position(31433, 32828, 7), signPos = Position(31371, 32377, 7) },
		[7008] = { caveName = "Falcon Paladin", enterPos = Position(31479, 32817, 7), signPos = Position(31374, 32377, 7) },

		[7009] = { caveName = "Dawnfire Asura", enterPos = Position(31588, 32819, 7), signPos = Position(31353, 32387, 7) },
		[7010] = { caveName = "Frost Flower Asura", enterPos = Position(31625, 32820, 7), signPos = Position(31356, 32387, 7) },
		[7011] = { caveName = "Midnight Asura", enterPos = Position(31666, 32820, 7), signPos = Position(31359, 32387, 7) },
		[7012] = { caveName = "Cobra Assassin", enterPos = Position(31702, 32820, 7), signPos = Position(31362, 32387, 7) },
		[7013] = { caveName = "Guzzlemaw", enterPos = Position(31732, 32777, 7), signPos = Position(31365, 32387, 7) },
		[7014] = { caveName = "Streaked Devourer", enterPos = Position(31733, 32820, 7), signPos = Position(31368, 32387, 7) },
		[7015] = { caveName = "Werecrocodile", enterPos = Position(31761, 32778, 7), signPos = Position(31371, 32387, 7) },
		[7016] = { caveName = "Naga Archer", enterPos = Position(31700, 32776, 7), signPos = Position(31374, 32387, 7) },

		--segundo andar
		--[7017] = { caveName = "Coming Soon", enterPos = Position(31491, 32794, 7), signPos = Position(31353, 32377, 6) },
		[7018] = { caveName = "Coming Soon", enterPos = Position(31382, 32762, 7), signPos = Position(31356, 32377, 6) },
		[7019] = { caveName = "True Midnight Asura 2A", enterPos = Position(31589, 32775, 3), signPos = Position(31359, 32377, 6) },
		[7020] = { caveName = "True Frost Flower Asura 2A", enterPos = Position(31626, 32776, 3), signPos = Position(31362, 32377, 6) },
		[7021] = { caveName = "True Drawnfire Asura 2A", enterPos = Position(31667, 32776, 3), signPos = Position(31365, 32377, 6) },
		--[7022] = { caveName = "Coming Soon", enterPos = Position(31394, 32827, 7), signPos = Position(31368, 32377, 6) },
		--[7023] = { caveName = "Coming Soon", enterPos = Position(31433, 32828, 7), signPos = Position(31371, 32377, 6) },
		--[7024] = { caveName = "Coming Soon", enterPos = Position(31479, 32817, 7), signPos = Position(31374, 32377, 6) },

		--[7025] = { caveName = "Coming Soon", enterPos = Position(31588, 32819, 7), signPos = Position(31353, 32387, 6) },
		--[7026] = { caveName = "Coming Soon", enterPos = Position(31625, 32820, 7), signPos = Position(31356, 32387, 6) },
		--[7027] = { caveName = "Coming Soon", enterPos = Position(31666, 32820, 7), signPos = Position(31359, 32387, 6) },
		--[7028] = { caveName = "Coming Soon", enterPos = Position(31702, 32820, 7), signPos = Position(31362, 32387, 6) },
		--[7029] = { caveName = "Coming Soon", enterPos = Position(31732, 32777, 7), signPos = Position(31365, 32387, 6) },
		--[7030] = { caveName = "Coming Soon", enterPos = Position(31733, 32820, 7), signPos = Position(31368, 32387, 6) },
		--[7031] = { caveName = "Coming Soon", enterPos = Position(31761, 32778, 7), signPos = Position(31371, 32387, 6) },
		--[7032] = { caveName = "Coming Soon", enterPos = Position(31700, 32776, 7), signPos = Position(31374, 32387, 6) },
	},

	storages = {
		time = 9999,
	},
}

-- table add event
local eventCaveExclusive = {}

-- Instalacao automatica de tabelas se ainda nao as tivermos (primeira instalacao)
db.query([[
	CREATE TABLE IF NOT EXISTS `cave_exclusive` (
		`cave` int unsigned NOT NULL DEFAULT '0',
		`owner` int NOT NULL DEFAULT '0',
		PRIMARY KEY `cave` (`cave`)
	) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;
]])

local function stopCaveExclusiveAction(playerGuid)
	stopEvent(eventCaveExclusive[playerGuid])
	eventCaveExclusive[playerGuid] = nil
end

local function getTimeString(self)
	local format = {
		{'day', self / 60 / 60 / 24},
		{'hour', self / 60 / 60 % 24},
		{'minute', self / 60 % 60},
		{'second', self % 60}
	}

	local out = {}
	for k, t in ipairs(format) do
		local v = math.floor(t[2])
		if(v > 0) then
			table.insert(out, (k < #format and (#out > 0 and ', ' or '') or ' and ') .. v .. ' ' .. t[1] .. (v ~= 1 and 's' or ''))
		end
	end
	local ret = table.concat(out)
	if ret:len() < 16 and ret:find('second') then
		local a, b = ret:find(' and ')
		ret = ret:sub(b + 1)
	end
	return ret
end

local function getPlayerNameByGuid(playerGuid)
	local resultId = db.storeQuery("SELECT `name` FROM `players` WHERE `id` = " .. playerGuid)
	if not resultId then
		return true
	end

	local playerName = Result.getString(resultId, "name")
	Result.free(resultId)

	return playerName
end

local function getCaveValueStorage(caveActionId)
	local caveId = caveExclusiva.caves[caveActionId]
	if not caveId then
		logger.error("[exclusive_caves] function getCaveValueStorage error in 'not caveId' (action id: {}).", caveActionId)
		return false
	end

	local resultId = db.storeQuery("SELECT `owner` FROM `cave_exclusive` WHERE `cave` = " .. caveActionId)
	if not resultId then
		logger.error("[exclusive_caves] function getCaveValueStorage error in 'not resultId' (action id: {}).", caveActionId)
		return false
	end

	local ownerGuid = Result.getNumber(resultId, "owner")
	Result.free(resultId)

	return ownerGuid
end

local function setCaveValueStorage(caveActionId, newOwnerGuid)
	local ownerGuid = getCaveValueStorage(caveActionId)
	if not ownerGuid then
		logger.error("[exclusive_caves] function setCaveValueStorage error in 'not ownerGuid' (action id: {}).", caveActionId)
		return false
	end

	db.query("UPDATE `cave_exclusive` SET `owner` = " .. newOwnerGuid .. " WHERE `cave` = " .. caveActionId .. "")

	return true
end

local function getAllCavesActionId()
	local caves = {}
	for key, value in pairs(caveExclusiva.caves) do
		table.insert(caves, key)
	end
	table.sort(caves, function(a, b) return b > a end)
	return caves
end

local function getOfflinePlayerStorage(playerGuid, storage)
	local player = Player(playerGuid)
	if player then
		return player:getStorageValue(storage)
	end

	local resultId = db.storeQuery("SELECT `value` FROM `player_storage` WHERE `player_id` = " .. playerGuid .. " AND `key` = " .. storage .. ";")
	if not resultId then
		return -1
	end

	local valueStorage = Result.getNumber(resultId, "value")
	Result.free(resultId)

	return valueStorage
end

local function resetSign(caveActionId)
	if not caveExclusiva.config.signs.useSigns then
		return true
	end

	local tile = Tile(caveExclusiva.caves[caveActionId].signPos)
	if not tile then
		logger.error("[exclusive_caves] function resetSign error in 'not tile' (action id: {}, sign pos: {}).", caveActionId, caveExclusiva.caves[caveActionId].signPos)
		return false
	end

	local sign = tile:getItemById(caveExclusiva.config.signs.signID)
	if not sign then
		logger.error("[exclusive_caves] function resetSign error in 'not sign' (action id: {}, sign id: {}).", caveActionId, caveExclusiva.config.signs.signID)
		return false
	end

	if not sign:setAttribute(ITEM_ATTRIBUTE_TEXT, "This cave is free!") then
		logger.error("[exclusive_caves] function resetSign error in 'not sign:setAttribute' (action id: {}).", caveActionId)
		return false
	end

	if not setCaveValueStorage(caveActionId, 0) then
		logger.error("[exclusive_caves] function resetSign error in 'not setCaveValueStorage' (action id: {}).", caveActionId)
		return false
	end

	return true
end

local function doRemoveCave(playerGuid, caveActionId)
	if not resetSign(caveActionId) then
		return false
	end

	local player = Player(playerGuid)
	if not player then
		return false
	end

	local caveId = caveExclusiva.caves[caveActionId]
	if not caveId then
		logger.error("[exclusive_caves] function doRemoveCave error in 'not caveId' (action id: {}).", caveActionId)
		return false
	end

	player:kv():scoped("exclusive-caves"):remove("cave-id")
	player:setStorageValue(caveExclusiva.storages.time, -1)

	local playerInCave = player:kv():scoped("exclusive-caves"):get("in-cave") or 0
	if playerInCave > 0 then
		player:kv():scoped("exclusive-caves"):remove("in-cave")
		player:teleportTo(player:getTown():getTemplePosition())
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, caveExclusiva.config.timeLeftMessageInCave:format(caveId.caveName))
		player:unregisterEvent("exclusiveCaveDeath")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, caveExclusiva.config.timeLeftMessage:format(caveId.caveName))
	end

	return true
end

local function setSign(playerGuid, caveActionId, timeLeft)
	if not caveExclusiva.config.signs.useSigns then
		return true
	end

	local tile = Tile(caveExclusiva.caves[caveActionId].signPos)
	if not tile then
		logger.error("[exclusive_caves] function setSign error in 'not tile' (action id: {}, sign pos: {}).", caveActionId, caveExclusiva.caves[caveActionId].signPos)
		return false
	end

	local sign = tile:getItemById(caveExclusiva.config.signs.signID)
	if not sign then
		logger.error("[exclusive_caves] function setSign error in 'not sign' (action id: {}, sign id: {}).", caveActionId, caveExclusiva.config.signs.signID)
		return false
	end

	local playerName = getPlayerNameByGuid(playerGuid)
	if not playerName then
		logger.error("[exclusive_caves] function setSign error in 'not playerName' (action id: {}, player guid: {}).", caveActionId, playerGuid)
		return false
	end

	if not sign:setAttribute(ITEM_ATTRIBUTE_TEXT, caveExclusiva.config.signs.signLook:format(playerName, os.date("%X", os.time() + timeLeft))) then
		logger.error("[exclusive_caves] function setSign error in 'not sign:setAttribute' (action id: {}).", caveActionId)
		return false
	end

	stopCaveExclusiveAction(playerGuid)
	eventCaveExclusive[playerGuid] = addEvent(doRemoveCave, timeLeft * 1000, playerGuid, caveActionId)

	return true
end

local function setCaveTo(playerGuid, caveActionId, itemId)

	local player = Player(playerGuid)
	if not player then
		logger.error("[exclusive_caves] function setCaveTo error in 'not player' (action id: {}, player guid: {}).", caveActionId, playerGuid)
		return false
	end

	local caveId = caveExclusiva.caves[caveActionId]
	if not caveId then
		logger.error("[exclusive_caves] function setCaveTo error in 'not caveId' (action id: {}).", caveActionId)
		return false
	end

	if not table.contains(caveExclusiva.config.actionItemIDS, itemId) then
		logger.error("[exclusive_caves] function setCaveTo error in 'not table.contains' (action id: {}, item id: {}).", caveActionId, itemId)
		return false
	end

	player:kv():scoped("exclusive-caves"):set("cave-id", caveActionId)
	player:kv():scoped("exclusive-caves"):remove("in-cave")
	player:setStorageValue(caveExclusiva.storages.time, os.time() + caveExclusiva.config.rentTime[itemId])

	local fullStamina = caveExclusiva.config.fullStaminaRestore[itemId]
	if fullStamina then
		player:setStamina(2520) -- full stamina
	end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, caveExclusiva.config.buyMessage:format(caveId.caveName, getTimeString(caveExclusiva.config.rentTime[itemId])))

	if not setSign(player:getGuid(), caveActionId, caveExclusiva.config.rentTime[itemId]) then
		return false
	end

	if not setCaveValueStorage(caveActionId, playerGuid) then
		logger.error("[exclusive_caves] function setCaveTo error in 'not setCaveValueStorage' (action id: {}).", caveActionId)
		return false
	end

	return true
end

-- ACTIONS DOOR ONUSE
local useDoor_action = Action()

function useDoor_action.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local caveId = caveExclusiva.caves[item.actionid]
	if not caveId then
		logger.error("[exclusive_caves] function useDoor_action error in 'not caveId' (action id: {}).", item.actionid)
		return true
	end

	local ownerGuid = getCaveValueStorage(item.actionid)
	if not ownerGuid then
		logger.error("[exclusive_caves] function useDoor_action error in 'not ownerGuid' (action id: {}).", item.actionid)
		return true
	end

	local playerGuid = player:getGuid()
	if ownerGuid ~= playerGuid then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[CAVE EXCLUSIVA] You do not own this cave, buy it with an exclusive key to gain entry.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end

	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:teleportTo(caveId.enterPos)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:kv():scoped("exclusive-caves"):set("in-cave", 1)
	player:registerEvent("exclusiveCaveDeath")

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[CAVE EXCLUSIVA] You entered your exclusive cave of " .. caveId.caveName .. ".")

	return true
end

for key, value in pairs(caveExclusiva.caves) do
	useDoor_action:aid(key)
end

useDoor_action:register()

-- MOVEMENT ONSTEPIN - EXIT
local exclusiveCaveExitTeleport = MoveEvent()
exclusiveCaveExitTeleport:type("stepin")

function exclusiveCaveExitTeleport.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	player:kv():scoped("exclusive-caves"):remove("in-cave")
	player:unregisterEvent("exclusiveCaveDeath")
	player:teleportTo(caveExclusiva.config.positionExitCaves)

	if not player:isInGhostMode() then
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end

	return true
end

exclusiveCaveExitTeleport:aid(caveExclusiva.config.actionIdTeleportExit)
exclusiveCaveExitTeleport:register()

-- CREATURESCRIPT ONLOGIN
local exclusiveCave_login = CreatureEvent("exclusiveCaveLogin")

function exclusiveCave_login.onLogin(player)

	local caveActionId = player:kv():scoped("exclusive-caves"):get("cave-id") or 0
	if caveActionId > 0 then
		local ownerGuid = getCaveValueStorage(caveActionId)
		if not ownerGuid then
			logger.error("[exclusive_caves] function exclusiveCave_login error in 'not ownerGuid' (action id: {}).", caveActionId)
			return true
		end

		local timeLeft = player:getStorageValue(caveExclusiva.storages.time) - os.time()
		local playerGuid = player:getGuid()

		if ownerGuid ~= playerGuid or timeLeft <= 0 then
			player:kv():scoped("exclusive-caves"):remove("cave-id")
			player:setStorageValue(caveExclusiva.storages.time, -1)

			local playerInCave = player:kv():scoped("exclusive-caves"):get("in-cave") or 0
			if playerInCave > 0 then
				player:kv():scoped("exclusive-caves"):remove("in-cave")
				player:teleportTo(player:getTown():getTemplePosition())
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, caveExclusiva.config.timeLeftMessageInCave:format(caveExclusiva.caves[caveActionId].caveName))
			end
		end

		local playerInCave2 = player:kv():scoped("exclusive-caves"):get("in-cave") or 0
		if playerInCave2 > 0 then
			player:registerEvent("exclusiveCaveDeath")
		end
	end

	return true
end

exclusiveCave_login:register()

-- CREATURESCRIPT ONDEATH
local exclusiveCave_death = CreatureEvent("exclusiveCaveDeath")

function exclusiveCave_death.onDeath(player, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)

	local playerInCave = player:kv():scoped("exclusive-caves"):get("in-cave") or 0
	if playerInCave > 0 then
		player:kv():scoped("exclusive-caves"):remove("in-cave")
		player:unregisterEvent("exclusiveCaveDeath")
	end

	return true
end

exclusiveCave_death:register()

-- GLOBALEVENTS ONSTARTUP
local exclusiveCave_startup = GlobalEvent("exclusiveCaveStartup")

function exclusiveCave_startup.onStartup()

	logger.info("[exclusive_caves] Setting Exclusive-Cave descriptions ...")
	for _, caveActionId in pairs(getAllCavesActionId()) do
		local caveId = caveExclusiva.caves[caveActionId]
		if not caveId then
			logger.error("[exclusive_caves] function exclusiveCave_startup error in 'not caveId' (action id: {}).", caveActionId)
			return true
		end

		local ownerGuid = getCaveValueStorage(caveActionId)
		if ownerGuid then
			if ownerGuid > 0 then
				local playerName = getPlayerNameByGuid(ownerGuid)
				if not playerName then
					logger.error("[exclusive_caves] function exclusiveCave_startup error in 'not playerName' (action id: {}, owner guid: {}).", caveActionId, ownerGuid)
					return true
				end

				local timeLeft = getOfflinePlayerStorage(ownerGuid, caveExclusiva.storages.time) - os.time()
				if timeLeft > 0 then
					if not setSign(ownerGuid, caveActionId, timeLeft) then
						logger.error("[exclusive_caves] function exclusiveCave_startup error in 'not setSign' (action id: {}, owner guid: {}).", caveActionId, ownerGuid)
						return true
					end
				else
					if not resetSign(caveActionId) then
						logger.error("[exclusive_caves] function exclusiveCave_startup error in 'not resetSign 1' (action id: {}).", caveActionId)
						return true
					end
				end
			else
				if not resetSign(caveActionId) then
					logger.error("[exclusive_caves] function exclusiveCave_startup error in 'not resetSign 2' (action id: {}).", caveActionId)
					return true
				end
			end
		else
			if not resetSign(caveActionId) then
				logger.error("[exclusive_caves] function exclusiveCave_startup error in 'not resetSign 3' (action id: {}).", caveActionId)
				return true
			end
		end
	end
	logger.info("[exclusive_caves] Done.")

	return true
end

exclusiveCave_startup:register()

-- ACTIONS ONUSE
local useKey_action = Action()

function useKey_action.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if table.contains(caveExclusiva.config.buyItemID, target.itemid) then

		local targetActionId = target.actionid
		local ownerGuid = getCaveValueStorage(targetActionId)
		if not ownerGuid then
			logger.error("[exclusive_caves] function useKey_action error in 'not ownerGuid' (action id: {}).", target.actionid)
			return true
		end

		local caveStorage = player:kv():scoped("exclusive-caves"):get("cave-id") or 0
		if caveStorage > 0 then
			local caveName = caveExclusiva.caves[caveStorage].caveName
			if not caveName then
				logger.error("[exclusive_caves] function useKey_action error in 'not caveName' (action id: {}).", caveStorage)
				return true
			end
			local timeLeft = player:getStorageValue(caveExclusiva.storages.time) - os.time()
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[CAVE EXCLUSIVA] You already own the exclusive ".. caveName ..", wait ".. getTimeString(timeLeft) .." to rent the cave again.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return true

		elseif ownerGuid > 0 then

			local playerName = getPlayerNameByGuid(ownerGuid)
			if not playerName then
				logger.error("[exclusive_caves] function useKey_action error in 'not playerName' (action id: {}, owner guid: {}).", targetActionId, ownerGuid)
				return true
			end

			local ownerTimeLeft = getOfflinePlayerStorage(ownerGuid, caveExclusiva.storages.time) - os.time()
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[CAVE EXCLUSIVA] This exclusive cave already belongs to the player ".. playerName ..", remain ".. getTimeString(ownerTimeLeft) .." for the cave to be free again.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return true

		else
			if not setCaveTo(player:getGuid(), targetActionId, item.itemid) then
				logger.error("[exclusive_caves] function useKey_action error in 'not setCaveTo' (action id: {}, item id: {}).", targetActionId, item.itemid)
				return true
			end

			if not item:remove(1) then
				logger.error("[exclusive_caves] function useKey_action error in 'not item:remove' (action id: {}, item id: {}).", targetActionId, item.itemid)
				return true
			end

			player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
		end
	end

	return true
end

for i = 1, #caveExclusiva.config.actionItemIDS do
	useKey_action:id(caveExclusiva.config.actionItemIDS[i])
end

useKey_action:register()

-- TALKACTIONS ONSAY
local caveExclusive_talkaction = TalkAction("!cave")

function caveExclusive_talkaction.onSay(player, words, param, type)

	local exaust = player:getExhaustion("talkactions")
	if exaust > 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[CAVE EXCLUSIVA] You have to wait " .. exaust .. " " .. (exaust > 1 and "seconds" or "second") .. " to use the command again.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end

	player:setExhaustion("talkactions", 10)

	if string.lower(param) == "time" then
		local caveActionIdKV = player:kv():scoped("exclusive-caves"):get("cave-id") or 0
		if caveActionIdKV > 0 then
			local timeLeft = player:getStorageValue(caveExclusiva.storages.time) - os.time()
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[CAVE EXCLUSIVA] You own " .. getTimeString(timeLeft) .. " remaining.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[CAVE EXCLUSIVA] You don't own any exclusive cave.")
		end

	elseif string.lower(param) == "leave" then

		if not Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[CAVE EXCLUSIVA] You must be in the protection zone to use these commands.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return true
		end

		local caveActionIdKV = player:kv():scoped("exclusive-caves"):get("cave-id") or 0
		if caveActionIdKV < 1 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[CAVE EXCLUSIVA] You don't own any exclusive cave.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return true
		end

		local caveName = caveExclusiva.caves[caveActionIdKV].caveName
		if not caveName then
			logger.error("[exclusive_caves] function caveExclusive_talkaction error in 'not caveName' (action id: {}).", caveActionIdKV)
			return true
		end

		local timeLeft = player:getStorageValue(caveExclusiva.storages.time) - os.time()
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[CAVE EXCLUSIVA] You left your exclusive ".. caveName .." where you still had ".. getTimeString(timeLeft) .." left time.")

		doRemoveCave(player:getGuid(), caveActionIdKV)

	elseif string.lower(param) == "stats" then
		if not caveExclusiva.config.caveStats then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[CAVE EXCLUSIVA] The stats are disabled.")
			return true
		end

		local info = "-----> Cave Exclusiva Stats <-----"
		for _, caveActionId in pairs(getAllCavesActionId()) do
			local caveId = caveExclusiva.caves[caveActionId]
			if not caveId then
				logger.error("[exclusive_caves] function caveExclusive_talkaction error in 'not caveId' (action id: {}).", caveActionId)
				return true
			end

			local ownerGuid = getCaveValueStorage(caveActionId)
			if not ownerGuid then
				logger.error("[exclusive_caves] function caveExclusive_talkaction error in 'not ownerGuid' (action id: {}).", caveActionId)
				return true
			end

			local hasOwner = ownerGuid > 0 and true or false
			local ownerName = hasOwner and getPlayerNameByGuid(ownerGuid) or "-> Cave Free <-"
			local timeLeft = hasOwner and getTimeString(getOfflinePlayerStorage(ownerGuid, caveExclusiva.storages.time) - os.time()) or "0 seconds"

			info = info .. "\n-----------------------------\n"
			info = info .. "* Cave: ".. caveId.caveName .. "\n"
			info = info .. "* Player: ".. ownerName .. "\n"
			info = info .. "* Time left: ".. timeLeft
		end

		player:showTextDialog(8977, info)

	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[CAVE EXCLUSIVA] Use the commands !CAVE TIME, !CAVE STATS or !CAVE LEAVE.")
	end

	return true
end

caveExclusive_talkaction:separator(" ")
caveExclusive_talkaction:groupType("normal")
caveExclusive_talkaction:register()
