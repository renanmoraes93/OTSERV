local internalNpcName = "Online Token"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 471,
	lookHead = 0,
	lookBody = 57,
	lookLegs = 0,
	lookFeet = 68,
	lookAddons = 2,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Buy Your Online Tokens! Find good benefits and items!" },
}

npcConfig.currency = 45152

npcConfig.shop = {
	{ name = "7 days for vip account", clientId = 44811, buy = 100 },
	{ name = "a present mount", clientId = 44930, buy = 200 },
	{ name = "a outfit box", clientId = 44816, buy = 200 },
 	{ name = "a exercise sword", clientId = 28552, buy = 25 },
 	{ name = "a exercise axe", clientId = 28553, buy = 25 },
  { name = "a exercise club", clientId = 28554, buy = 25 },
  { name = "a exercise bow", clientId = 28555, buy = 25 },
  { name = "a exercise rod", clientId = 28556, buy = 25 },
  { name = "a exercise wand", clientId = 28557, buy = 25 },
 	{ name = "a durable exercise sword", clientId = 35279, buy = 50 },
 	{ name = "a durable exercise axe", clientId = 35280, buy = 50 },
  { name = "a durable exercise club", clientId = 35281, buy = 50 },
  { name = "a durable exercise bow", clientId = 35282, buy = 50 },
  { name = "a durable exercise rod", clientId = 35283, buy = 50 },
  { name = "a durable exercise wand", clientId = 35284, buy = 50 },
  { name = "a lasting exercise sword", clientId = 35285, buy = 125 },
 	{ name = "a lasting exercise axe", clientId = 35286, buy = 125 },
  { name = "a lasting exercise club", clientId = 35287, buy = 125 },
  { name = "a lasting exercise bow", clientId = 35288, buy = 125 },
  { name = "a lasting exercise rod", clientId = 35289, buy = 125 },
  { name = "a lasting exercise wand", clientId = 35290, buy = 125 },
  { name = "ferumbras exercise dummy", clientId = 28559, buy = 1250 },
  { name = "a Roullete Token", clientId = 45248, buy = 125 },
  { name = "a cassino ticket", clientId = 45238, buy = 50 },
  { name = "a common key", clientId = 45277, buy = 100 },
 
}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

local answerType = {}
local answerLevel = {}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local function greetCallback(npc, creature)
	local playerId = creature:getId()
	npcHandler:setTopic(playerId, 0)
	return true
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if MsgContains(message, "information") then
		npcHandler:say({ "{Tokens} are small objects made of metal or other materials. You can use them to buy superior equipment from token traders like me.", "There are several ways to obtain the tokens I'm interested in - killing certain bosses, for example. In exchange for a certain amount of tokens, I can offer you some first-class items." }, npc, creature)
	elseif MsgContains(message, "worth") then
		-- to do: check if Heart of Destruction was killed
		-- after kill message: 'You disrupted the Heart of Destruction, defeated the World Devourer and bought our world some time. You have proven your worth.'
		npcHandler:say({ "Disrupt the Heart of Destruction, fell the World Devourer to prove your worth and you will be granted the power to imbue 'Powerful Strike', 'Powerful Void' and --'Powerful Vampirism'." }, npc, creature)
	elseif MsgContains(message, "tokens") then
		npc:openShopWindow(creature)
		npcHandler:say("If you have any gold tokens with you, let's have a look! These are my offers.", npc, creature)
	elseif MsgContains(message, "trade") then
		npcHandler:say({ "I trade tokens sail {tokens}. Make your choice, please!" }, npc, creature)
		npcHandler:setTopic(playerId, 1)
	elseif npcHandler:getTopic(playerId) == 3 then
		if MsgContains(message, "yes") then
			local neededCap = 0
			for i = 1, #products[answerType[playerId]][answerLevel[playerId]].itens do
				neededCap = neededCap + ItemType(products[answerType[playerId]][answerLevel[playerId]].itens[i].id):getWeight() * products[answerType[playerId]][answerLevel[playerId]].itens[i].amount
			end
			if player:getFreeCapacity() > neededCap then
				if player:getItemCount(npc:getCurrency()) >= products[answerType[playerId]][answerLevel[playerId]].value then
					for i = 1, #products[answerType[playerId]][answerLevel[playerId]].itens do
						player:addItem(products[answerType[playerId]][answerLevel[playerId]].itens[i].id, products[answerType[playerId]][answerLevel[playerId]].itens[i].amount)
					end
					player:removeItem(npc:getCurrency(), products[answerType[playerId]][answerLevel[playerId]].value)
					npcHandler:say("There it is.", npc, creature)
					npcHandler:setTopic(playerId, 0)
				else
					npcHandler:say("I'm sorry but it seems you don't have enough " .. ItemType(npc:getCurrency()):getPluralName():lower() .. " ..? yet. Bring me " .. products[answerType[playerId]][answerLevel[playerId]].value .. " of them and we'll make a trade.", npc, creature)
				end
			else
				npcHandler:say("You don't have enough capacity. You must have " .. neededCap .. " oz.", npc, creature)
			end
		elseif MsgContains(message, "no") then
			npcHandler:say("Your decision. Come back if you have changed your mind.", npc, creature)
		end
		npcHandler:setTopic(playerId, 0)
	end
	return true
end

npcHandler:setCallback(CALLBACK_SET_INTERACTION, onAddFocus)
npcHandler:setCallback(CALLBACK_REMOVE_INTERACTION, onReleaseFocus)

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, false)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
