local config = {
	minutesToAnswer = 1000000, -- minutes to answer anti bot system
	minutesToAnswerVania = 5, -- minutes to answer anti bot system
	delayAntiBot = math.random(99999999999,99999999999), -- minutes of delay of delayAntiBot
	maxGroupId = 3, -- groupid higher than this don't have antiBotSystem Activated
	prisionPosition = Position(37302, 22072, 14), -- if don't answer, go to this pos
	prisionMinutes = 10, -- time inside the prision
	antibotChannelId = 12, -- id do channel antibot
	antiBotRoomPosition = Position(31514, 32622, 7),
	minutesToResetPz = math.random(30, 70), -- minutes to answer anti bot system
	onOff = 0, -- 0 off 1 on
}

local prison = {
    storage = 59999, -- used for material storage
    exhaustStorage = 60000, -- used for exhaust
    materialId = 45151, -- ore ID recieved from mining
    chance = 20, -- chance to receive materials
    miningExhaust = 2, -- based on seconds
    minedEffect = 50, -- effect on success
    failEffect = CONST_ME_POFF, -- effect on fail
    pickId = 31615, -- pick
    rockMineId = 1910, -- rock ID to use with pick
    smallRockId = 1913, -- ID to change to when mining successful
    rockMineRegeneration = 5, -- Seconds till it regenerate from the small rock to the mineRock
    position = Position(37302, 22072, 14), --position of your prison
    templePosition = Position(32369,32241,7), -- currently Thais Temple
    wagonAid = 39011, -- the actionid used for the ore wagon
    MiningRockActionId = 39012, -- the actionid used for rockMineId's inside the mine
	antibotChannelId = 12, -- id do channel antibot
}

local antiBotPrisionEvent = {}
local antiBotCheckAnswerEvent = {}
local antiBotCheckAnswerEventVania = {}
local antiBotResetPz = {}
local antiBotEvent = {}

local lastPlayerPosition = {}

local function stopAllAntiBotEvent(playerGuid)
	stopEvent(antiBotPrisionEvent[playerGuid])
	stopEvent(antiBotCheckAnswerEvent[playerGuid])
	stopEvent(antiBotCheckAnswerEventVania[playerGuid])
	stopEvent(antiBotEvent[playerGuid])
	stopEvent(antiBotResetPz[playerGuid])
	
	antiBotResetPz[playerGuid] = nil
	antiBotPrisionEvent[playerGuid] = nil
	antiBotCheckAnswerEvent[playerGuid] = nil
	antiBotCheckAnswerEventVania[playerGuid] = nil
	antiBotEvent[playerGuid] = nil
	
end

local function checkPrisioned(playerGuid)
	local player = Player(playerGuid)
	if player then
		local isPrisioned = player:kv():get("antibot-is-prisioned") or false
		if isPrisioned then
			local prisionTime = player:kv():get("antibot-prision-time") or 0
			if os.time() >= prisionTime then
				player:openChannel(config.antibotChannelId)
				player:sendChannelMessage(player, "[Anti-Bot] You had completed your time here in the prision! You may now relog to go to the city.", TALKTYPE_CHANNEL_O, config.antibotChannelId)

				player:kv():remove("antibot-is-prisioned")
				player:kv():remove("antibot-prision-time")
				player:teleportTo(player:getTown():getTemplePosition())
			else
				antiBotPrisionEvent[playerGuid] = addEvent(checkPrisioned, (60 * 1000), playerGuid)
			end
		end
	end
end

local function checkAnswerForPrision(playerGuid)
	local player = Player(playerGuid)
	if player then
		local tile = Tile(player:getPosition())
		if tile then
			
			local wrongAnswers = player:kv():get("antibot-wrong-answers") or 0
			local isPrisioned = player:kv():get("antibot-is-prisioned") or false
			local answerPlayer = player:kv():get("antibot-answer-player") or false
			local resultOperation = player:kv():get("antibot-result-operation") or 0

			player:kv():remove("antibot-first-number")
			player:kv():remove("antibot-second-number")
			player:kv():remove("antibot-wrong-answers")
			player:kv():remove("antibot-answer-player")
			player:kv():remove("antibot-wrong-answers")

			player:openChannel(config.antibotChannelId)

			if wrongAnswers > 5 or (not answerPlayer and not isPrisioned and resultOperation > 0) then
				player:teleportTo(config.prisionPosition)
				player:kv():set("antibot-is-prisioned", true)
				--player:kv():set("antibot-prision-time", os.time() + (config.prisionMinutes * 60))
				--antiBotPrisionEvent[playerGuid] = addEvent(checkPrisioned, 1000, playerGuid)
				
				local rocksToPick = player:kv():get("rocks-to-pick") or 0
	
				--player:teleportTo(config.prisionPosition)
				if rocksToPick > 0 then
				   -- if greater than 0 indicates the player was already prisioned before, so increase punishment
				   rocksToPick = rocksToPick + math.random(1, 3)
				else 
				  rocksToPick = 3
				  player:kv():set("rocks-to-pick", rocksToPick)
				end
				
				player:setStorageValue(prison.storage, rocksToPick)
				player:addItem(prison.pickId)
				
				if wrongAnswers > 5 then
					player:sendChannelMessage(player, "[Anti-Bot] Voce foi preso porque respondeu errado 5 vezes a Delegada.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot] Minere as pedras com a picareta para conseguir sair da prisao.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot] Cada vez que voce for preso o numero de pedras necessarias ira aumentar.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
				else
					player:sendChannelMessage(player, "[Anti-Bot] Seu tempo acabou! Voce foi preso por cavebot e nao responder a Delegada.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot] Minere as pedras com a picareta para conseguir sair da prisao.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot] Cada vez que voce for preso o numero de pedras necessarias para sua soltura ira aumentar.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
				end
				
			end
			
		end
	end
end

local function checkAnswerForVania(playerGuid)
	local player = Player(playerGuid)
	if player then
		local tile = Tile(player:getPosition())
		if tile then
			
			local wrongAnswers = player:kv():get("antibot-wrong-answers") or 0
			local isPrisioned = player:kv():get("antibot-is-prisioned") or false
			local answerPlayer = player:kv():get("antibot-answer-player") or false
			local resultOperation = player:kv():get("antibot-result-operation") or 0
			local isOnVania = player:kv():get("antibot-on-vania") or false
			
			player:kv():remove("antibot-first-number")
			player:kv():remove("antibot-second-number")
			player:kv():remove("antibot-wrong-answers")
			player:kv():remove("antibot-answer-player")
			player:kv():remove("antibot-wrong-answers")
			player:kv():remove("antibot-result-operation")

			player:openChannel(config.antibotChannelId)

			if (not answerPlayer and not isPrisioned and resultOperation > 0 and not isOnVania) then
			
				player:teleportTo(config.antiBotRoomPosition) -- Vania position
				
				player:kv():set("antibot-on-vania", true)
				
				if wrongAnswers > 5 then
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot] Voce foi enviado a Delegada porque respondeu errado 5 vezes.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot] Responda para voltar para o templo e nao ser preso.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					local firstNumber = math.random(1, 9)
					local secondNumber = math.random(1, 9)
					local resultOperation = firstNumber + secondNumber

					player:kv():set("antibot-first-number", firstNumber)
					player:kv():set("antibot-second-number", secondNumber )
					player:kv():set("antibot-result-operation", resultOperation)

					player:openChannel(config.antibotChannelId)
					
					--lastPlayerPosition = player:getPosition()
					-- player:teleportTo(config.antiBotRoomPosition)

					player:sendChannelMessage(player, "[Anti-Bot] Quanto eh " .. firstNumber .. " + " .. secondNumber .. " ? ", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot] Para responder diga: !antibot resultado (Exemplo: !Antibot 50)", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					
				else
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot] Seu tempo acabou! Voce foi enviado a Delegada por nao responder no tempo.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot] Responda para voltar para para o templo e nao ser preso.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					local firstNumber = math.random(1, 9)
					local secondNumber = math.random(1, 9)
					local resultOperation = firstNumber + secondNumber

					player:kv():set("antibot-first-number", firstNumber)
					player:kv():set("antibot-second-number", secondNumber )
					player:kv():set("antibot-result-operation", resultOperation)

					player:openChannel(config.antibotChannelId)
					
					--lastPlayerPosition = player:getPosition()
					-- player:teleportTo(config.antiBotRoomPosition)

					player:sendChannelMessage(player, "[Anti-Bot] Quanto eh " .. firstNumber .. " + " .. secondNumber .. " ? ", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot] Para responder diga: !antibot resultado (Exemplo: !Antibot 50)", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					
				end
				
				stopEvent(antiBotCheckAnswerEventVania[playerGuid])
				antiBotCheckAnswerEventVania[playerGuid] = nil
				antiBotCheckAnswerEvent[playerGuid] = addEvent(checkAnswerForPrision, config.minutesToAnswerVania * 60 * 1000, playerGuid)
				
			end
			
		end
	end
end


local function antiBot(playerGuid)
	local player = Player(playerGuid)
	if player then
		local isPrisioned = player:kv():get("antibot-is-prisioned") or false
		if not isPrisioned then
			local tile = Tile(player:getPosition())
			if tile then
				if not tile:hasFlag(TILESTATE_PROTECTIONZONE) and not staminaBonus.eventsTrainer[player:getId()] then
					local firstNumber = math.random(1, 9)
					local secondNumber = math.random(1, 9)
					local resultOperation = firstNumber + secondNumber

					player:kv():set("antibot-first-number", firstNumber)
					player:kv():set("antibot-second-number", secondNumber )
					player:kv():set("antibot-result-operation", resultOperation)

					player:openChannel(config.antibotChannelId)
					
					--lastPlayerPosition = player:getPosition()
					-- player:teleportTo(config.antiBotRoomPosition)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot] Ola, " .. player:getName() .. "! Voce tem " .. config.minutesToAnswer .. " minutos para responder o sistema antibot com o resultado da pergunta: ", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot] Quanto eh " .. firstNumber .. " + " .. secondNumber .. " ? ", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot] Para responder diga: !antibot resultado (Exemplo: !Antibot 50)", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot] Se responder errado 5x ou nao responder, sera enviado a Delegada para verificacao.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "[Anti-Bot] Quanto eh " .. firstNumber .. " + " .. secondNumber .. " ? Responda no chat Antibot.")

					antiBotCheckAnswerEventVania[playerGuid] = addEvent(checkAnswerForVania, config.minutesToAnswer * 60 * 1000, playerGuid)
					
				end
			end
		end

		antiBotEvent[playerGuid] = addEvent(antiBot, config.delayAntiBot * 60 * 1000, playerGuid)
		
	end
end

local function checkPlayerIsOnPz(playerGuid)
	local player = Player(playerGuid)
	if player then
		local tile = Tile(player:getPosition())
		if tile then
			if tile:hasFlag(TILESTATE_PROTECTIONZONE) or staminaBonus.eventsTrainer[player:getId()] then
				local pzTime = player:kv():get("player-pz-time") or 0
				-- print("pzTime: " .. pzTime)
				local pzTimeTotal = 0
				
				if pzTime == 0 then
					--print("Entrou 0")
					player:kv():set("player-pz-time", os.time())
				else
					pzTimeTotal = os.time() - pzTime 
					--print("pzTimeTotal: " .. pzTimeTotal)
				end
			
				if pzTimeTotal > config.minutesToResetPz * 60 then
					--print("Resetou")
					
					-- reset all
					player:kv():remove("antibot-wrong-answers")
					player:kv():remove("antibot-first-number")
					player:kv():remove("antibot-second-number")
					player:kv():remove("antibot-result-operation")
					player:kv():remove("antibot-answer-player")
					player:kv():remove("antibot-on-vania")
					player:kv():remove("player-pz-time")
					
					-- start again
					local playerGuid = player:getGuid()
					local isPrisioned = player:kv():get("antibot-is-prisioned") or false
					if isPrisioned then
						player:teleportTo(config.prisionPosition)
						--local prisionTime = player:kv():get("antibot-prision-time") or 0
						--if os.time() >= prisionTime then
						--	player:kv():remove("antibot-prision-time")
						--	player:kv():remove("antibot-is-prisioned")
						--	player:teleportTo(player:getTown():getTemplePosition())
						--else
						--	antiBotPrisionEvent[playerGuid] = addEvent(checkPrisioned, 1000, playerGuid)
						--	player:teleportTo(config.prisionPosition)
						--end
					end

					if config.delayAntiBot <= config.minutesToAnswer then
						logger.error("[Anti-Bot System] variable delayAntiBot need to be higher than minutesToAnswer.")
						return true
					end

					if player:getGroup():getId() > config.maxGroupId then
						--player:openChannel(config.antibotChannelId)
						--player:sendChannelMessage(player, "[Anti-Bot] Right answer, but you had already answered more than 3 wrong times.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
						return true
					end

					stopEvent(antiBotPrisionEvent[playerGuid])
					stopEvent(antiBotCheckAnswerEvent[playerGuid])
					stopEvent(antiBotCheckAnswerEventVania[playerGuid])
					stopEvent(antiBotEvent[playerGuid])
					stopEvent(antiBotResetPz[playerGuid])
					
					antiBotResetPz[playerGuid] = nil
					antiBotPrisionEvent[playerGuid] = nil
					antiBotCheckAnswerEvent[playerGuid] = nil
					antiBotCheckAnswerEventVania[playerGuid] = nil
					antiBotEvent[playerGuid] = nil
				
					antiBotEvent[playerGuid] = addEvent(antiBot, config.delayAntiBot * 60 * 1000, playerGuid)
					antiBotResetPz[playerGuid] = addEvent(checkPlayerIsOnPz, 1000, playerGuid)
					
				else
					stopEvent(antiBotResetPz[playerGuid])
					antiBotResetPz[playerGuid] = {}
					antiBotResetPz[playerGuid] = addEvent(checkPlayerIsOnPz, 30000, playerGuid)
				end
				
			else
				player:kv():set("player-pz-time", 0)
				stopEvent(antiBotResetPz[playerGuid])
				antiBotResetPz[playerGuid] = {}
				antiBotResetPz[playerGuid] = addEvent(checkPlayerIsOnPz, 30000, playerGuid)
			end
		
		end
	end
end

-- CREATURESCRIPT LOGIN
local playerLogin = CreatureEvent("anti-bot-login")

function playerLogin.onLogin(player)

	if onOff == 0 then
 	   return true
	end

	local playerGuid = player:getGuid()
	local isPrisioned = player:kv():get("antibot-is-prisioned") or false
	if isPrisioned then
		player:teleportTo(config.prisionPosition)
		--local prisionTime = player:kv():get("antibot-prision-time") or 0
		--if os.time() >= prisionTime then
		--	player:kv():remove("antibot-prision-time")
		--	player:kv():remove("antibot-is-prisioned")
		--	player:teleportTo(player:getTown():getTemplePosition())
		--else
		--	antiBotPrisionEvent[playerGuid] = addEvent(checkPrisioned, 1000, playerGuid)
		--	player:teleportTo(config.prisionPosition)
		--end
	end

	if config.delayAntiBot <= config.minutesToAnswer then
		logger.error("[Anti-Bot System] variable delayAntiBot need to be higher than minutesToAnswer.")
		return true
	end

	if player:getGroup():getId() > config.maxGroupId then
		--player:openChannel(config.antibotChannelId)
		--player:sendChannelMessage(player, "[Anti-Bot] Right answer, but you had already answered more than 3 wrong times.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
		return true
	end
	
	local pzTime = player:kv():get("player-bot-tracker") or 0
	-- print("pzTime: " .. pzTime)
	local pzTimeTotal = 0
	
	if pzTime == 0 then
		--print("Entrou 0")
		player:kv():set("player-bot-tracker", os.time())
	else
		pzTimeTotal = os.time() - pzTime 
		--print("pzTimeTotal: " .. pzTimeTotal)
	end
	
	if (pzTimeTotal/60) * 60 * 1000 > config.delayAntiBot * 60 * 1000 then

		antiBotEvent[playerGuid] = addEvent(antiBot, config.delayAntiBot * 60 * 1000, playerGuid)
		player:kv():set("player-bot-tracker", os.time())

	else
	
		antiBotEvent[playerGuid] = addEvent(antiBot, (pzTimeTotal/60) * 60 * 1000, playerGuid)
	
	end

	antiBotResetPz[playerGuid] = addEvent(checkPlayerIsOnPz, 30000, playerGuid)

	return true
end

playerLogin:register()

-- CREATURESCRIPT LOGOUT
local playerLogout = CreatureEvent("anti-bot-logout")

function playerLogout.onLogout(player)

	if onOff == 0 then
 	   return true
	end

	stopAllAntiBotEvent(player:getGuid())

	player:kv():remove("antibot-wrong-answers")
	player:kv():remove("antibot-first-number")
	player:kv():remove("antibot-second-number")
	player:kv():remove("antibot-result-operation")
	player:kv():remove("antibot-answer-player")
	player:kv():remove("antibot-on-vania")
	player:kv():remove("player-pz-time")

	return true
end

playerLogout:register()

-- TALKACTION SAY
local talkaction = TalkAction("!antibot")

function talkaction.onSay(player, words, param)
	local isPrisioned = player:kv():get("antibot-is-prisioned") or false
	local answerPlayer = player:kv():get("antibot-answer-player") or false
	local resultOperation = player:kv():get("antibot-result-operation") or 0
	local isOnVania = player:kv():get("antibot-on-vania") or false

	if not isPrisioned and not answerPlayer and resultOperation > 0 then

		player:openChannel(config.antibotChannelId)
		
		local wrongAnswers = player:kv():get("antibot-wrong-answers") or 0
		if wrongAnswers > 5 then
			player:sendChannelMessage(player, "[Anti-Bot] Voce ja respondeu 5x errado. Voce sera preso em breve.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
			return true
		end

		local answer = tonumber(param)
		
		if answer ~= resultOperation then
		
			if (wrongAnswers + 1)  >= 5 then
				
				if isOnVania then
				
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot] Voce foi preso por responder errado 5x.", TALKTYPE_CHANNEL_O, config.antibotChannelId)	
					player:sendChannelMessage(player, "[Anti-Bot] Minere as pedras com a picareta para conseguir sair da prisao.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot] Cada vez que voce for preso o numero de pedras necessarias ira aumentar.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:kv():remove("antibot-first-number")
					player:kv():remove("antibot-second-number")
					player:kv():remove("antibot-wrong-answers")
					player:kv():remove("antibot-answer-player")
					player:kv():remove("antibot-wrong-answers")
					player:kv():remove("antibot-on-vania")
					player:kv():remove("player-pz-time")
					player:openChannel(config.antibotChannelId)
					player:teleportTo(config.prisionPosition)
					player:kv():set("antibot-is-prisioned", true)
					--player:kv():set("antibot-prision-time", os.time() + (config.prisionMinutes * 60))
					--antiBotPrisionEvent[playerGuid] = addEvent(checkPrisioned, 1000, playerGuid)
					
					local rocksToPick = player:kv():get("rocks-to-pick") or 0
		
					--player:teleportTo(config.prisionPosition)
					if rocksToPick > 0 then
					   -- if greater than 0 indicates the player was already prisioned before, so increase punishment
					   rocksToPick = rocksToPick + math.random(1, 3)
					   player:kv():set("rocks-to-pick", rocksToPick)
					else 
					  rocksToPick = 3
					  player:kv():set("rocks-to-pick", rocksToPick)
					end
					player:setStorageValue(prison.storage, rocksToPick)
					player:teleportTo(prison.position)
					player:addItem(prison.pickId)
				
				else
				
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot] Voce foi enviado a Delegada porque respondeu errado 5 vezes.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot] Responda para voltar para o templo e nao ser preso.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					local firstNumber = math.random(1, 9)
					local secondNumber = math.random(1, 9)
					local resultOperation = firstNumber + secondNumber

					player:kv():set("antibot-first-number", firstNumber)
					player:kv():set("antibot-second-number", secondNumber )
					player:kv():set("antibot-result-operation", resultOperation)

					player:openChannel(config.antibotChannelId)
					
					--lastPlayerPosition = player:getPosition()
					-- player:teleportTo(config.antiBotRoomPosition)

					player:sendChannelMessage(player, "[Anti-Bot] Quanto eh " .. firstNumber .. " + " .. secondNumber .. " ? ", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot] Para responder diga: !antibot resultado (Exemplo: !Antibot 50)", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot] .", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:teleportTo(config.antiBotRoomPosition) -- Vania position
					player:kv():set("antibot-on-vania", true)
				
				end 
				
			else
				player:sendChannelMessage(player, "[Anti-Bot] Resposta errada! Voce respondeu " .. (wrongAnswers + 1) .. " resposta errada(s)! O limite eh 5.", TALKTYPE_CHANNEL_O, config.antibotChannelId)	
			end
		
			player:kv():set("antibot-wrong-answers", wrongAnswers + 1)
			
			return true
		end

		
		if isOnVania then
			player:teleportTo(player:getTown():getTemplePosition())
		end 

		player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, prison.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, prison.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, prison.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, prison.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, prison.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, prison.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, prison.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, prison.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, prison.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, prison.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, prison.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, prison.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, prison.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, prison.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, prison.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, prison.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)		
		player:sendChannelMessage(player, "[Anti-Bot] Resposta certa, obrigado por responder.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot] Em breve iremos checar novamente se voce esta cavebot afk.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot] Recomendamos que sempre fique no computador acompanhando para evitar mortes indesejadas e prisao inesperada.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot]", TALKTYPE_CHANNEL_O, config.antibotChannelId)
	

		player:kv():remove("antibot-wrong-answers")
		player:kv():remove("antibot-first-number")
		player:kv():remove("antibot-second-number")
		player:kv():remove("antibot-result-operation")
		player:kv():remove("antibot-is-prisioned")
		player:kv():remove("antibot-prision-time")
		player:kv():remove("antibot-answer-player")
		player:kv():remove("antibot-wrong-answers")
		player:kv():remove("antibot-result-operation")
		player:kv():remove("antibot-on-vania")
		player:kv():remove("player-pz-time")
		
		local playerGuid = player:getGuid()
		
		stopEvent(antiBotPrisionEvent[playerGuid])
		stopEvent(antiBotCheckAnswerEvent[playerGuid])
		stopEvent(antiBotCheckAnswerEventVania[playerGuid])
		stopEvent(antiBotEvent[playerGuid])
		stopEvent(antiBotResetPz[playerGuid])
		
		antiBotResetPz[playerGuid] = nil
		antiBotPrisionEvent[playerGuid] = nil
		antiBotCheckAnswerEvent[playerGuid] = nil
		antiBotCheckAnswerEventVania[playerGuid] = nil
		antiBotEvent[playerGuid] = nil
	
		antiBotEvent[playerGuid] = addEvent(antiBot, config.delayAntiBot * 60 * 1000, player:getGuid())
		antiBotResetPz[playerGuid] = addEvent(checkPlayerIsOnPz, 30000, player:getGuid())
	
	end
end

talkaction:separator(" ")
talkaction:groupType("normal")
talkaction:register()
